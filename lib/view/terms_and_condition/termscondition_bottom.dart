import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/custom_webview.dart';

class TermConditionBottom extends StatefulWidget {
  const TermConditionBottom({super.key});

  @override
  State<TermConditionBottom> createState() => _TermConditionBottomState();
}

class _TermConditionBottomState extends State<TermConditionBottom> {
  bool _isChecked=false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.blue.shade900,
              shape: CircleBorder(side: BorderSide(color: Colors.white,width: 2.w),),
              side: BorderSide(color: Colors.white,width: 2.w),
              value: _isChecked, 
              onChanged: (value) {
                setState(() {
                  _isChecked=value!;
                });
              },
              ),
              Text('I agree to the',style: TextStyle(fontSize: 16.sp),textAlign: TextAlign.start,),
              TextButton(
                onPressed: () {
                var route=MaterialPageRoute(builder: (context) => AppWebView(title: 'Terms of Service',url: 'https://consensys.net/terms-of-use/?fbclid=IwAR2kMwL6kIWjUYqRRllThA3RAMBoWdSbauXiLAXIVNlbBc6EsFQkMahDkoA',),);
                Navigator.push(context, route);
              }, 
              child: Text('Terms of Service',style: TextStyle(fontSize: 16.sp,color: Colors.blue.shade900),textAlign: TextAlign.start,)
              ),
          ],
        ),
        SizedBox(height: 20.h,),
        SizedBox(
          height: 50.h,
          width: double.infinity,
          child: MaterialButton(
          elevation: 0,
          color: _isChecked?Colors.blue.shade900:Colors.grey,
          textColor: _isChecked?Colors.white:Colors.blue.shade900,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23.r)),
          onPressed:() => _isChecked?Navigator.of(context).pushNamedAndRemoveUntil('goToAccount', (Route<dynamic> route) => false):null,
          child: Text('Get Started',style: TextStyle(fontSize: 18.sp,)),
          ),
        )
      ],
    );
  }
}