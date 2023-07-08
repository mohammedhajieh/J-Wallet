import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';
import 'package:j_wallet/view/import_wallet/importwallet_body.dart';
import 'package:j_wallet/view/import_wallet/importwallet_header.dart';

class ImportWallet extends StatelessWidget {
  const ImportWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'J-Wallet'),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          children: [
            const ImportWalletHeader(),
            SizedBox(
              height: 25.h,
            ),
            const ImportWalletBody(),
          ],
        ),
      ),
    );
  }
}
