import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/page_wallet/drawer_menu/text_name.dart';

class HomeWalletHeader extends StatefulWidget {
  const HomeWalletHeader({super.key});

  @override
  State<HomeWalletHeader> createState() => _HomeWalletHeaderState();
}

class _HomeWalletHeaderState extends State<HomeWalletHeader> {
  @override
  void initState() {
    super.initState();
    if (getName.text.isEmpty) {
      getName.text = 'Account';
    } else if (getName.text.length > 12) {
      getName.text = 'Account';
    } else {
      getName.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Wallet',
          style: TextStyle(fontSize: 24.sp),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'Solana Main Network',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          height: 75.h,
          width: 75.w,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  image: AssetImage('assets/image/crypto.png'))),
        ),
        SizedBox(
          height: 10.w,
        ),
        Text(
          getName.text,
          style: TextStyle(fontSize: 20.sp),
        ),
      ],
    );
  }
}
