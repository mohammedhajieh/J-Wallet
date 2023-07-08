import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';
import 'package:j_wallet/view/page_wallet/send_coin/sendcoin_body.dart';
import 'package:j_wallet/view/page_wallet/send_coin/sendcoin_header.dart';

class SendCoin extends StatefulWidget {
  const SendCoin({super.key});

  @override
  State<SendCoin> createState() => _SendCoinState();
}

class _SendCoinState extends State<SendCoin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Send Coins',
        action: [
          IconButton(
            onPressed: scanQr,
            icon: const Icon(Icons.qr_code_scanner),
          ),
        ],
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: ListView(
            children: [
              const SendCoinHeader(),
              SizedBox(
                height: 30.h,
              ),
              const SendCoinbody(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode(
        '#2A99CF',
        'cancel',
        true,
        ScanMode.QR,
      ).then((value) {
        setState(() {
          if (value != '-1') {
            qr = value;
          } else {
            qr;
          }
        });
      });
    } catch (e) {
      setState(() {
        qr = 'unable to read this';
      });
    }
  }
}
