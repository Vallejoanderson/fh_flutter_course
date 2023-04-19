import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:sql_project_starter/providers/scan_list_providers.dart';
import 'package:sql_project_starter/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          // String barcode = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR);

          // const barcodeScanRes = 'http://fernando-herrera.com';

          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          // final newScan = scanListProvider.newScan(barcodeScanRes);
          final newScan =
              await scanListProvider.newScan('geo:-12.096779,-77.029814');

          launchUrlFn(context, newScan);
        });
  }
}
