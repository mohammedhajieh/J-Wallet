import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget secretContainer({
  required String secret1,
  required String secret2
})=>
Padding(

            padding: EdgeInsets.symmetric(vertical: 9.h,horizontal: 20.w),

            child: Row(

             children: [

              Expanded(

                child: Container(

                  alignment: Alignment.center,

                  height: 35.h,

                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10.r),

                    border: Border.all(color: Colors.white,width: 2.w),

                    color: Colors.black

                  ),

                  child: Text(secret1,style: TextStyle(fontSize: 20.sp)),

                ),

              ),

              SizedBox(width: 20.w,),

              Expanded(

                child: Container(

                  alignment: Alignment.center,

                  height: 35.h,

                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10.r),

                    border: Border.all(color: Colors.white,width: 2.w),

                    color: Colors.black

                  ),

                  child: Text(secret2,style: TextStyle(fontSize: 20.sp)),

                ),

              )

             ], 

            ),

          );