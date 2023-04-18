
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  
  static Database? _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async => 
    _database ??= await initDB();

  Future<Database> initDB() async {
    // Path to the database

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // 83242420492-234324234324-234324324234-23423432432
    final path = join( documentsDirectory.path, 'ScansDB.db' );
    
    print( path );

    // Create a new database
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: ( Database db, int version) async {
        await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          type TEXT,
          value TEXT
        )
        ''');
      }
    );

  }

}