import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';
import 'package:http/http.dart' as http;
import 'package:j_wallet/view/import_wallet/importwallet_body.dart';
import 'package:j_wallet/view/login_account/login_body.dart';
import 'package:j_wallet/view/secret_phrase/secretphrase_body.dart';

final GlobalKey<FormState> _fromState = GlobalKey<FormState>();

class Amount extends StatefulWidget {
  const Amount({super.key});

  @override
  State<Amount> createState() => _AmountState();
}

String token = '';
String publicKey = '';
Future<void> buyUsdt(BuildContext context) async {
  // Define the API endpoint URL
  const String apiUrl = 'http://10.0.2.2:5170/BuyUsdt';
  // Create a JSON payload to send in the request body
  final Map<String, dynamic> data = {
    // 'name': 'John Doe',
    // 'email': 'john.doe@example.com',
    'token': token,
    'walletAddress': publicKey,
    'amount': amountbuy
  };

  // Convert the payload to JSON
  final String jsonData = json.encode(data);

  try {
    // Send the POST request
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonData,
    );

    // Check the response status code
    if (response.statusCode == 200) {
      // Request was successful
      // ignore: avoid_print
      print('POST request successful');
      // ignore: avoid_print
      print(response.body);
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              'Payment USD',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.sp),
            )),
            content: Text(
              '✓ Payment Successful ',
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
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'goToAccount', (route) => false);
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ),
              )
            ],
          );
        },
      );
    } else {
      // Request failed
      // ignore: avoid_print
      print('POST request failed');
    }
  } catch (e) {
    // An error occurred
    // ignore: avoid_print
    print('Error: $e');
  }
}

String amountbuy = '';

class _AmountState extends State<Amount> {
  final TextEditingController _ammount = TextEditingController();
  @override
  void initState() {
    if (getToken.isNotEmpty) {
      token = getToken;
    } else if (tokenImpoart.isNotEmpty) {
      token = tokenImpoart;
    } else {
      token = tokenRegister;
    }
    if (address.isNotEmpty) {
      publicKey = address;
    } else if (addressImpoart.isNotEmpty) {
      publicKey = addressImpoart;
    } else {
      publicKey = getaddressLogin;
    }
    super.initState();
    // ignore: avoid_print
    print(_ammount.text);
    // ignore: avoid_print
    print(token);
    // ignore: avoid_print
    print(publicKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: 'Buy Coin'),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Form(
              key: _fromState,
              child: ListView(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Enter an amount in USD to exchange it with USDT, then click "Finish" button.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  TextFormField(
                    controller: _ammount,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Amount cannot be empty.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
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
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 15.r),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'USD',
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          var fromData = _fromState.currentState;
                          if (fromData!.validate()) {
                            amountbuy = _ammount.text;
                            // ignore: avoid_print
                            print('Valid');
                            // ignore: avoid_print
                            print(amountbuy);
                            buyUsdt(context);
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
                          'Finsh',
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
