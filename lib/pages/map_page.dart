import 'package:flutter/material.dart';
import 'package:sql_project_starter/providers/db_provider.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Map Page"),
      ),
      body: Center(
        child: Text(scan.value),
      ),
    );
  }
}
