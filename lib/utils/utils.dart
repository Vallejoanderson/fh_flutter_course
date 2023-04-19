import 'package:flutter/widgets.dart';
import 'package:sql_project_starter/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

Future<void> launchUrlFn(BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse("https://www.google.com");
  // Open the website
  print(scan.value);
  print(scan.type);
  if (scan.type == 'http') {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
