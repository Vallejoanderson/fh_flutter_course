import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_project_starter/pages/directions_page.dart';
import 'package:sql_project_starter/pages/maps_page.dart';
import 'package:sql_project_starter/providers/db_provider.dart';
import 'package:sql_project_starter/providers/ui_provider.dart';
import 'package:sql_project_starter/widgets/custom_navigationBar.dart';
import 'package:sql_project_starter/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('History'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon( Icons.delete_forever ),
            onPressed: () {},
          )
        ]
      ),
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

  // Read database

  DBProvider.db.database;

    switch(currentIndex) {
      case 0:
        return MapsPage();
      case 1:
        return DirectionsPage();
      default:
      return MapsPage();
    }
  }
}