import 'package:flutter/material.dart';
import 'package:sql_project_starter/widgets/scan_tiles.dart';

class DirectionsPage extends StatelessWidget {
  const DirectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(type: 'http');
  }
}
