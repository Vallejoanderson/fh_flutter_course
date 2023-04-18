import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_project_starter/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: ( int value ) => uiProvider.selectedMenuOpt = value,
      currentIndex: currentIndex ,
      items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon( Icons.map),
        label: 'Map',
      ),
      BottomNavigationBarItem(
        icon: Icon( Icons.directions),
        label: 'Directions',
      ),
    ],
    );
  }
}