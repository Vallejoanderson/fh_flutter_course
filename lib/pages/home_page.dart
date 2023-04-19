import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_project_starter/pages/directions_page.dart';
import 'package:sql_project_starter/pages/maps_page.dart';
import 'package:sql_project_starter/providers/db_provider.dart';
import 'package:sql_project_starter/providers/scan_list_providers.dart';
import 'package:sql_project_starter/providers/ui_provider.dart';
import 'package:sql_project_starter/widgets/custom_navigationBar.dart';
import 'package:sql_project_starter/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text('History'),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                scanListProvider.deleteAllScans();
              },
            )
          ]),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Obtener provider
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    // Read database
    // final tempScan = ScanModel(value: 'http://google.com');

    // DBProvider.db.newScan(tempScan);
    // DBProvider.db.getScanById(30).then((scan) => print(scan?.value));

    // DBProvider.db.getAllScans().then((s) => print(s));

    // DBProvider.db.deleteAllScans().then(print);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return const MapsPage();
      case 1:
        scanListProvider.loadScansByType('http');
        return const DirectionsPage();
      default:
        scanListProvider.loadScansByType('geo');
        return const MapsPage();
    }
  }
}
