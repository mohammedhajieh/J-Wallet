import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/page_wallet/drawer_menu/text_name.dart';

class SendCoinHeader extends StatelessWidget {
  const SendCoinHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Payment Method',
          style: TextStyle(fontSize: 18.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Solana Main Network',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        TextFormField(
          readOnly: true,
          controller: getName,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: 'From',
            labelStyle: TextStyle(fontSize: 16.sp, color: Colors.grey),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                borderSide: BorderSide(color: Colors.white, width: 2.w)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                borderSide: BorderSide(color: Colors.white, width: 2.w)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
