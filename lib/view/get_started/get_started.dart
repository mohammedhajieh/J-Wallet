import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/get_started/getstarted_body.dart';
import 'package:j_wallet/view/get_started/getstarted_bottom.dart';
import 'package:j_wallet/view/get_started/getstarted_header.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
      child: ListView(
        children: [
         const GetStartedHeader(),
          SizedBox(height: 20.h,),
          const GetStartedBody(),
          SizedBox(height: 20.h,),
          const GetStartedBottom(),
        ],
      ),
    );
  }
}