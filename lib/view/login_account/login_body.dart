import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:j_wallet/view/component/text_field.dart';
import 'package:j_wallet/view/import_wallet/importwallet_body.dart';
import 'package:j_wallet/view/page_wallet/drawer_menu/text_name.dart';
import 'package:j_wallet/view/page_wallet/home_wallet/homewallet_bottom.dart';
import 'package:j_wallet/view/page_wallet/transfer/home_transfer.dart';
import 'package:j_wallet/view/secret_phrase/secretphrase_body.dart';
import 'package:http/http.dart' as http;

class LoginWalletBody extends StatefulWidget {
  const LoginWalletBody({super.key});

  @override
  State<LoginWalletBody> createState() => _LoginWalletBodyState();
}

final GlobalKey<FormState> _fromState = GlobalKey<FormState>();
String getPassLogin = '';
String getSecretLogin = '';
String getaddressLogin = '';
String getError = '';
String getToken = '';
// ignore: prefer_typing_uninitialized_variables
var getUserID;
Response? response;

class _LoginWalletBodyState extends State<LoginWalletBody> {
  final TextEditingController _secretPhrase = TextEditingController();
  final TextEditingController _createPassword = TextEditingController();
  bool _obscureText1 = true;
  Future<void> login(BuildContext context) async {
    // Define the API endpoint URL
    const String apiUrl = 'http://10.0.2.2:5170/api/Auth/Login';
    // Create a JSON payload to send in the request body
    final Map<String, dynamic> data = {
      // 'name': 'John Doe',
      // 'email': 'john.doe@example.com',
      'secretPhrase': getSecretLogin.replaceAll(' ', ','),
      'password': getPassLogin,
    };

    // Convert the payload to JSON
    final String jsonData = json.encode(data);

    try {
      // Send the POST request
      response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonData,
      );
      // Check the response status code
      if (response!.statusCode == 200) {
        var responseData1 = json.decode(response!.body);
        getToken = responseData1['token'];
        var responseData = json.decode(response!.body);
        getaddressLogin = responseData['address'];
        var responseData2 = json.decode(response!.body);
        getUserID = responseData2['userID'];
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil(
            'termCondition', (Route<dynamic> route) => false);
        // Request was successful
        // ignore: avoid_print
        print('POST request successful');
        // ignore: avoid_print
        print(response!.body);
        // ignore: avoid_print
        print(getToken);
      } else {
        _fromState.currentState!.save();
        var responseData = json.decode(response!.body);
        getError = responseData['error'];
        // ignore: avoid_print
        print(getError);
        // Request failed
        // ignore: avoid_print
        print('POST request failed');
        // ignore: avoid_print
        print(response!.body);
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                  child: Text(
                'Error',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.sp),
              )),
              content: Text(
                getError,
                style: TextStyle(
                  fontSize: 16.sp,
                ),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.blue.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              actions: [
                const Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                )
              ],
            );
          },
        );
      }
    } catch (e) {
      // An error occurred
      // ignore: avoid_print
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _fromState,
        child: Column(children: [
          TextFormField(
            controller: _secretPhrase,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Secret phrase cannot be empty.';
              }
              return null;
            },
            minLines: 5,
            maxLines: 8,
            keyboardType: TextInputType.multiline,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              labelText: 'Enter your Secret Recovery Phrase',
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.w,
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              labelStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 16.sp,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.w,
                ),
              ),
              errorStyle: TextStyle(fontSize: 12.sp, height: 0.h),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          getTextFromFieldDefult(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password cannot be empty.';
              }
              return null;
            },
            title: 'Password',
            keyboard: TextInputType.visiblePassword,
            controller: _createPassword,
            obscureText: _obscureText1,
            function: () {
              setState(() {
                _obscureText1 = !_obscureText1;
              });
            },
            // ignore: dead_code
            sufix: _obscureText1 ? Icons.visibility : Icons.visibility_off,
          ),
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
            height: 50.h,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  var fromData = _fromState.currentState;
                  if (fromData!.validate()) {
                    getPassLogin = _createPassword.text;
                    getSecretLogin = _secretPhrase.text;
                    // ignore: avoid_print
                    print(getPassLogin);
                    // ignore: avoid_print
                    print(getSecretLogin);
                    // ignore: avoid_print
                    print('Valid');
                    login(context);
                    address = '';
                    addressImpoart = '';
                    tokenImpoart = '';
                    tokenRegister = '';
                    userID = 0;
                    userIdSing = 0;
                    usdt.clear();
                    recevieTransfer.clear();
                    sendTransfer.clear();
                    getName.text = '';
                  } else {
                    // ignore: avoid_print
                    print('Not Valid');
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23.r),
                    )),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                )),
          ),
        ]));
  }
}
