import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedHeader extends StatelessWidget {
  const GetStartedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Welcome to J-Wallet',
        style: TextStyle(fontSize: 18.sp),),
        SizedBox(height: 20.h,),
        Text('J-Wallet is a secure wallet making the world of web3 accessible to all',
        textAlign: TextAlign.center,
        style: TextStyle(
        fontSize: 16.sp,
        ),
        ),
      ],
    );
  }
}