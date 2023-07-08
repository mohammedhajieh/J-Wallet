import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountBottom extends StatelessWidget {
  const AccountBottom({super.key});

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
              Navigator.pushNamed(context, 'importWallet');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23.w),
                    side: BorderSide(color: Colors.blue.shade900, width: 3.w))),
            child: Text(
              'Import using recovery phrase',
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          height: 50.h,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'createNewAccount');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.w),
                ),
              ),
              child: Text(
                'Create a new wallet',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              )),
        ),
      ],
    );
  }
}
