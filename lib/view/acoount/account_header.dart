import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text('Welcome to J-Wallet',
         style: TextStyle(fontSize: 18.sp),),
         SizedBox(height: 20.h,),
         Text('Import an existing wallet or create a new one',
         textAlign: TextAlign.center,
         style: TextStyle(
         fontSize: 16.sp,
         ),
        ),
      ],
    );
  }
}