import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openExternalUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await canLaunchUrl(uri)) {
    debugPrint('Could not launch $url');
    return;
  }
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

Future<void> openPhone(String phone) async {
  final uri = Uri(scheme: 'tel', path: phone);
  if (!await canLaunchUrl(uri)) {
    debugPrint('Could not launch tel:$phone');
    return;
  }
  await launchUrl(uri);
}

Future<void> openEmail(String email, {String? subject, String? body}) async {
  final uri = Uri(
    scheme: 'mailto',
    path: email,
    query: _encodeQuery({
      if (subject != null) 'subject': subject,
      if (body != null) 'body': body,
    }),
  );
  if (!await canLaunchUrl(uri)) {
    debugPrint('Could not launch mailto:$email');
    return;
  }
  await launchUrl(uri);
}

String? _encodeQuery(Map<String, String> params) {
  if (params.isEmpty) return null;
  return params.entries
      .map(
        (e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
      )
      .join('&');
}
