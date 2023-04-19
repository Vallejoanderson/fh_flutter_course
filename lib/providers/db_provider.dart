import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:sql_project_starter/models/scan_model.dart';
export 'package:sql_project_starter/models/scan_model.dart'; // Al importar este archivo tambien retorna el ScanModel

class DBProvider {
  static Database? _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async => _database ??= await initDB();

  Future<Database> initDB() async {
    // Path to the database

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // 83242420492-234324234324-234324324234-23423432432
    final path = join(documentsDirectory.path, 'ScansDB.db');

    // print(path);
    // print(documentsDirectory);

    // Create a new database
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          type TEXT,
          value TEXT
        );
        ''');
    });
  }

  // newScanRaw(ScanModel newScan) async {
  //   final id = newScan.id;
  //   final type = newScan.type;
  //   final value = newScan.value;

  //   //Verify database
  //   final db = await database;

  //   final res = await db.rawInsert('''
  //     INSERT INTO Scans( id, type, value )
  //       VALUES( $id, '$type', '$value');
  //   ''');

  //   return res;
  // }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());

    //Res es el id del ultimo registro insertado
    // print(res);

    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<List<ScanModel>> getScansByType(String type) async {
    final db = await database;
    final res = await db.query('Scans', where: 'type = ?', whereArgs: [type]);
    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.delete('Scans');
    return res;
  }
}
