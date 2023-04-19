import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_project_starter/providers/scan_list_providers.dart';
import 'package:sql_project_starter/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String type;

  const ScanTiles({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.blue,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteScanById(scans[i].id!);
        },
        child: ListTile(
          leading: Icon(
              type == 'http' ? Icons.home_outlined : Icons.map_outlined,
              color: Colors.blue),
          title: Text(scans[i].value),
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => launchUrlFn(context, scans[i]),
        ),
      ),
    );
  }
}
