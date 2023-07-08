import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:j_wallet/view/component/text_field.dart';
import 'package:http/http.dart' as http;
import 'package:j_wallet/view/login_account/login_body.dart';
import 'package:j_wallet/view/page_wallet/drawer_menu/text_name.dart';
import 'package:j_wallet/view/page_wallet/home_wallet/homewallet_bottom.dart';
import 'package:j_wallet/view/page_wallet/transfer/home_transfer.dart';
import 'package:j_wallet/view/secret_phrase/secretphrase_body.dart';

class ImportWalletBody extends StatefulWidget {
  const ImportWalletBody({super.key});

  @override
  State<ImportWalletBody> createState() => _ImportWalletBodyState();
}

final GlobalKey<FormState> _fromState = GlobalKey<FormState>();
String getPassImpoart = '';
String getSecretImpoart = '';
String addressImpoart = '';
String errorImpoart = '';
String tokenImpoart = '';
// ignore: prefer_typing_uninitialized_variables
var userID;
Response? response;

class _ImportWalletBodyState extends State<ImportWalletBody> {
  final TextEditingController _secretPhrase = TextEditingController();
  final TextEditingController _createPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  Future<void> newLogin(BuildContext context) async {
    // Define the API endpoint URL
    const String apiUrl = 'http://10.0.2.2:5170/api/Auth/NewLogin';
    // Create a JSON payload to send in the request body
    final Map<String, dynamic> data = {
      // 'name': 'John Doe',
      // 'email': 'john.doe@example.com',
      'secretPhrase': getSecretImpoart.replaceAll(' ', ','),
      'password': getPassImpoart,
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
        tokenImpoart = responseData1['token'];
        var responseData = json.decode(response!.body);
        addressImpoart = responseData['address'];
        var responseData2 = json.decode(response!.body);
        userID = responseData2['userID'];
        // ignore: avoid_print
        print(tokenImpoart);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil(
            'termCondition', (Route<dynamic> route) => false);
        // Request was successful
        // ignore: avoid_print
        print('POST request successful');
        // ignore: avoid_print
        print(response!.body);
      } else {
        _fromState.currentState!.save();
        var responseData = json.decode(response!.body);
        errorImpoart = responseData['error'];
        // ignore: avoid_print
        print(errorImpoart);
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
                'Invalid Secret Recovery Phrase',
                style: TextStyle(fontSize: 16.sp),
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
      child: Column(
        children: [
          TextFormField(
            controller: _secretPhrase,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Secret phrase cannot be empty.';
              } else if (RegExp(r'[(*&^%0-9-]').hasMatch(value)) {
                return 'The secret phrase does not contain numbers.';
              } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)]').hasMatch(value)) {
                return 'The secret phrase does not contain characters.';
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
              final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
              final hasUppercase = RegExp(r'[A-Z]');
              final hasLowercase = RegExp(r'[a-z]');
              if (value!.isEmpty) {
                return 'Password cannot be empty.';
              } else if (value.length < 6 || value.length > 11) {
                return 'The password greater than 6 less than 12.';
              } else if (value.contains(validCharacters)) {
                return 'please use at least one special characters.';
              } else if (!hasUppercase.hasMatch(value)) {
                return 'please use one capital letter at least';
              } else if (!hasLowercase.hasMatch(value)) {
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
                _obscureText1 = !_obscureText1;
              });
            },
            // ignore: dead_code
            sufix: _obscureText1 ? Icons.visibility : Icons.visibility_off,
          ),
          SizedBox(
            height: 15.h,
          ),
          getTextFromFieldDefult(
            validator: (value) {
              if (value != _createPassword.text) {
                return 'password are not matching.';
              } else if (value!.isEmpty) {
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
                _obscureText2 = !_obscureText2;
              });
            },
            // ignore: dead_code
            sufix: _obscureText2 ? Icons.visibility : Icons.visibility_off,
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
                    getPassImpoart = _createPassword.text;
                    getSecretImpoart = _secretPhrase.text;
                    // ignore: avoid_print
                    print(getPassImpoart);
                    // ignore: avoid_print
                    print(getSecretImpoart);
                    // ignore: avoid_print
                    print('Valid');
                    newLogin(context);
                    address = '';
                    getaddressLogin = '';
                    getToken = '';
                    tokenRegister = '';
                    userIdSing = 0;
                    getUserID = 0;
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
                  'Import Account',
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
