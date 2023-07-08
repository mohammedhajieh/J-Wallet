import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 325.h,
            width: double.infinity,
            decoration:const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('assets/image/j-wallet.png'),fit: BoxFit.contain),
            ),
          ),
      ],
    );
  }
}