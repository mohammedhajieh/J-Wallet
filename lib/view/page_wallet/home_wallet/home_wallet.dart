import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/page_wallet/home_wallet/homewallet_body.dart';
import 'package:j_wallet/view/page_wallet/home_wallet/homewallet_bottom.dart';
import 'package:j_wallet/view/page_wallet/home_wallet/homewallet_header.dart';

class HomeWallet extends StatelessWidget {
  const HomeWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: ListView(
        children: [
          const HomeWalletHeader(),
          SizedBox(
            height: 20.h,
          ),
          const HomeBody(),
          SizedBox(
            height: 30.h,
          ),
          const HomeWalletBottom(),
        ],
      ),
    );
  }
}
