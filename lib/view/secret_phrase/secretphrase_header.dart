import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SecretPhraseHeader extends StatelessWidget {
  const SecretPhraseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Secret Phrase',
        style: TextStyle(fontSize: 18.sp),),
        SizedBox(height: 15.h,),
        Text('This is your secret phrase, write it down on a piece of paper and keep it in a safe place.You will be prompted to re-enter this phrase (in order) when you lose your password',
        textAlign: TextAlign.center,
        style: TextStyle(
        fontSize: 16.sp,
        ),
        ),
      ],
    );
  }
}