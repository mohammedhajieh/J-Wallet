import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/acoount/account_body.dart';
import 'package:j_wallet/view/acoount/account_bottom.dart';
import 'package:j_wallet/view/acoount/account_header.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'J-Wallet'),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
          child: ListView(
            children: [
                const AccountHeader(),
                SizedBox(height: 20.h,),
                const AccountBody(),
                SizedBox(height: 20.h,),
                const AccountBottom()
            ],
          ),
        ),
      ),
    );
  }
}