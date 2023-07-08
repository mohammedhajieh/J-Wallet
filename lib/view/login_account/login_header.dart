import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 140.h,
          width: 140.w,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/image/j-wallet.png'),
                  fit: BoxFit.cover),
              color: Colors.white),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'Welcome Back !',
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
