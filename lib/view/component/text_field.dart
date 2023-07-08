import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget getTextFromFieldDefult(
  {
    required String ? Function(String ? value)  validator,
    required String title,
    required TextInputType keyboard,
    required TextEditingController controller,
    bool obscureText=false,
    IconData ? sufix,
    Function()?function,
  }
)=>
TextFormField(
  validator: validator,
  obscureText: obscureText,
  controller: controller,
  keyboardType: keyboard,
  style: TextStyle(fontSize: 18.sp),
  decoration: InputDecoration(
    labelText: title,
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide:   BorderSide(color: Colors.white,width: 2.w,),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 18.h),
    labelStyle: TextStyle(color: Colors.grey.shade400,fontSize: 16.sp,),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide:   BorderSide(color: Colors.white,width: 2.w,),
    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide:   BorderSide(color: Colors.white,width: 2.w,),
    ),
    errorStyle: TextStyle(fontSize: 12.sp),
    suffixIcon: sufix!=null ? IconButton(icon: Icon(sufix),onPressed: function,color: Colors.white,):null,
  ),
);

