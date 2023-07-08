import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedBottom extends StatelessWidget {
  const GetStartedBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50.h,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'getStarted');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  // fixedSize: Size(250.w, 50.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23.w),
                      side:
                          BorderSide(color: Colors.blue.shade900, width: 3.w))),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              )),
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          height: 50.h,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  elevation: 0,
                  fixedSize: Size(250.w, 50.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23.w),
                      side:
                          BorderSide(color: Colors.blue.shade900, width: 3.w))),
              child: Text(
                'Login using recovery phrase',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              )),
        ),
      ],
    );
  }
}
