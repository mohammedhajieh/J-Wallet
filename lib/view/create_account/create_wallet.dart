import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';
import 'package:j_wallet/view/create_account/createaccount_body.dart';
import 'package:j_wallet/view/create_account/createaccount_header.dart';


class CreateWallet extends StatelessWidget {
  const CreateWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'J-Wallet',),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
          child: ListView(
            children: [
              const CreateAccountHeader(),
              SizedBox(height: 120.h,),
              const CreateAccountBody(),             
        ]
        ),
    )
    )
    );
  }
}