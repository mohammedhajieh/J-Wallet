import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImportWalletHeader extends StatelessWidget {
  const ImportWalletHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Create Password',
          style: TextStyle(fontSize: 18.sp),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'This password will unlock your J-Wallet only on this device',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        )
      ],
    );
  }
}
