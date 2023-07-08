import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermConditionHeader extends StatelessWidget {
  const TermConditionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 125.h,
          width: 125.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage('assets/image/j-wallet.png'),fit: BoxFit.cover),
            color: Colors.white
          ),
        ),
        SizedBox(height: 20.h,),
        Text('You\'re all done',
        style: TextStyle(fontSize: 25.sp),),
        SizedBox(height: 15.h,),
        Text('You can now fully enjoy your wallet',
        textAlign: TextAlign.center,
        style: TextStyle(
        color: Colors.grey,
        fontSize: 18.sp,
      ),
      ),
      ],
    );
  }
}