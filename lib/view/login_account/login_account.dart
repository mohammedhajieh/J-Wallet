import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';
import 'package:j_wallet/view/login_account/login_body.dart';

import 'login_header.dart';

class LoginAccount extends StatelessWidget {
  const LoginAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'J-Wallet'),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: ListView(
            children: [
              const LoginHeader(),
              SizedBox(
                height: 30.h,
              ),
              const LoginWalletBody(),
            ],
          ),
        ),
      ),
    );
  }
}
