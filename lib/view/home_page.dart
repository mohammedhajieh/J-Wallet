import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';
import 'package:j_wallet/view/get_started/get_started.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
      title: 'J-Wallet'
      ),
      body: Container(
        width: double.infinity.w,
        height: double.infinity.h,
        color: Colors.black,
        child: const GetStarted(),
      ),
    );
  }
}