import 'package:app/core/logic/helper_methods.dart';
import 'package:app/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCodeView extends StatefulWidget {
  const ScanQrCodeView({super.key});

  @override
  State<ScanQrCodeView> createState() => _ScanQrCodeViewState();
}

class _ScanQrCodeViewState extends State<ScanQrCodeView> {
  final qrKey = GlobalKey();
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              Text("Please Scan You QR Code"),
              SizedBox(
                height: 250,
                width: 250,
                child
                    : QRView(
                  key: qrKey,
                  formatsAllowed: [
                    BarcodeFormat.qrcode,
                    BarcodeFormat.codabar
                  ],
                  overlay: QrScannerOverlayShape(
                    borderColor:Colors.orange,
                    borderRadius: 25,
                    borderWidth: 6,
                    overlayColor: Colors.white,

                    // cutOutHeight: 300,
                    // cutOutWidth: 300
                  ),
                  onQRViewCreated: (QRViewController controller) {
                    this.controller = controller;
                    controller.scannedDataStream
                        .listen(
                      (event) {},
                    )
                        .onData(
                      (data) {
                        print("****************");
                        print(data.code);
                        controller.pauseCamera();
                        // navigateTo(HomeView());
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
