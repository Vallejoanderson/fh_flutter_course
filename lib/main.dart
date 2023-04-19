import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_project_starter/pages/home_page.dart';
import 'package:sql_project_starter/pages/map_page.dart';
import 'package:sql_project_starter/providers/scan_list_providers.dart';
import 'package:sql_project_starter/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'map': (_) => MapPage(),
        },
        // theme: ThemeData(
        //   primaryColor: Colors.deepPurple,
        //   floatingActionButtonTheme: FloatingActionButtonThemeData(
        //     backgroundColor: Colors.deepPurple
        //   )
        // ),
      ),
    );
  }
}
