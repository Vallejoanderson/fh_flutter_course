import 'package:flutter/material.dart';
import 'package:sql_project_starter/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String typeSelected = "http";

  Future<ScanModel> newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);

    newScan.id = id;

    if (typeSelected == newScan.type) {
      notifyListeners();
      scans.add(newScan);
    }

    return newScan;
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  loadScansByType(String type) async {
    // print(type);
    final scans = await DBProvider.db.getScansByType(type);
    // print(scans);
    this.scans = [...scans];
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
    loadScansByType(typeSelected);
  }
}
