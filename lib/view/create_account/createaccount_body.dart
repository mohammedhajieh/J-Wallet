import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/text_field.dart';

class CreateAccountBody extends StatefulWidget {
  const CreateAccountBody({super.key});

  @override
  State<CreateAccountBody> createState() => _CreateAccountBodyState();
}
String getPass='';
class _CreateAccountBodyState extends State<CreateAccountBody> {
  final TextEditingController _createPassword=TextEditingController();
  final GlobalKey<FormState> _fromState=GlobalKey<FormState>();
  final TextEditingController _confirmPassword=TextEditingController();
  bool _obscureText1=true;
  bool _obscureText2=true;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    void sendData(){
      var fromData=_fromState.currentState;
      if(fromData!.validate()){
        getPass=_createPassword.text;
        // ignore: avoid_print
        print(_createPassword.text);
        // ignore: avoid_print
        print(_confirmPassword.text);
        // ignore: avoid_print
        print('Valid');
        Navigator.pushNamed(context, 'createPassword');
      }else{
        // ignore: avoid_print
        print('Not Valid');
      }
    } 
    return Form(
      key: _fromState,
      child: Column(
            children: [
              getTextFromFieldDefult(
                validator: (value) {
                  final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
                  final hasUppercase = RegExp(r'[A-Z]');
                  final hasLowercase = RegExp(r'[a-z]');
                  if(value!.isEmpty){
                  return 'Password cannot be empty.';
                  }
                  else if(value.length <6 || value.length>11){
                  return 'The password greater than 6 less than 12.';
                  }
                  else if(value.contains(validCharacters)){
                  return 'please use at least one special characters.';
                  }
                  else if(!hasUppercase.hasMatch(value)){
                  return 'please use one capital letter at least';
                  } else if(!hasLowercase.hasMatch(value)){
                  return 'please use one small letter at least.';
                  }
                  return null;
                  },
                title: 'New Password', 
                keyboard: TextInputType.visiblePassword,
                controller: _createPassword,
                obscureText: _obscureText1,
                function: () {
                  setState(() {
                    _obscureText1=!_obscureText1;
                  });
                },
                // ignore: dead_code
                sufix: _obscureText1?Icons.visibility:Icons.visibility_off,
                ),        
                SizedBox(height: 40.h,),
                getTextFromFieldDefult(
                  validator: (value) {
                    if(value!=_createPassword.text){
                    return 'password are not matching.';
                    }else if(value!.isEmpty){
                      return 'Password cannot be empty.';
                    }
                    return null;
                  },
                  title: 'Confirm Password', 
                  keyboard: TextInputType.visiblePassword, 
                  controller: _confirmPassword,
                  obscureText: _obscureText2,
                  function: () {
                  setState(() {
                    _obscureText2=!_obscureText2;
                  });
                  },
                // ignore: dead_code
                  sufix: _obscureText2?Icons.visibility:Icons.visibility_off,
                  ),
                  SizedBox(height: 70.h,),
                  SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                  sendData();
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.w),
                  )
                  ),
                  child: Text('Create Password',
                  style: TextStyle(
                  fontSize: 18.sp,
          ),
          )),
          ),
        ],
      ),
    );
  }
}
