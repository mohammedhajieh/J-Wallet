import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/import_wallet/importwallet_body.dart';
import 'package:j_wallet/view/login_account/login_body.dart';
import 'package:j_wallet/view/page_wallet/home_wallet/homewallet_bottom.dart';
import 'package:j_wallet/view/secret_phrase/secretphrase_body.dart';
import 'package:http/http.dart' as http;

class SendCoinbody extends StatefulWidget {
  const SendCoinbody({super.key});

  @override
  State<SendCoinbody> createState() => _SendCoinbodyState();
}

// ignore: prefer_typing_uninitialized_variables
var coinSend;
String addSend = '';
String tokSend = '';
// ignore: prefer_typing_uninitialized_variables
var userIdSend;
String qr = '';
var payment = 'Sol';
Future<void> sendCoin(BuildContext context) async {
  // Define the API endpoint URL
  const String apiUrl = 'http://10.0.2.2:5170/Send';
  // Create a JSON payload to send in the request body
  final Map<String, dynamic> data = {
    // 'name': 'John Doe',
    // 'email': 'john.doe@example.com',
    'amount': coinSend,
    'senderAddress': addSend,
    'receiverAddress': qr,
    'coinId': payment == 'Sol' ? '556' : '563',
    'token': tokSend,
    'userId': userIdSend
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
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              'Send ${payment == 'Sol' ? 'Solana' : 'J Coins'}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.sp),
            )),
            content: Text(
              '✓ The conversion was completed successfully',
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
      // Request was successful
      // ignore: avoid_print
      print('POST request successful');
      // ignore: avoid_print
      print(response.body);
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              'Balance',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.sp),
            )),
            content: Text(
              'Insufficient balance of the wallet',
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
      // Request failed
      // ignore: avoid_print
      print('POST request failed');
      // ignore: avoid_print
      print(response.body);
    }
  } catch (e) {
    // An error occurred
    // ignore: avoid_print
    print('Error: $e');
  }
}

class _SendCoinbodyState extends State<SendCoinbody> {
  // ignore: prefer_final_fields
  TextEditingController _qr = TextEditingController();
  final GlobalKey<FormState> sendState = GlobalKey<FormState>();
  final TextEditingController _coin = TextEditingController();
  @override
  void initState() {
    if (getToken.isNotEmpty) {
      tokSend = getToken;
    } else if (tokenImpoart.isNotEmpty) {
      tokSend = tokenImpoart;
    } else {
      tokSend = tokenRegister;
    }
    if (address.isNotEmpty) {
      addSend = address;
    } else if (addressImpoart.isNotEmpty) {
      addSend = addressImpoart;
    } else {
      addSend = getaddressLogin;
    }
    if (userID != 0) {
      userIdSend = userID;
    } else if (getUserID != 0) {
      userIdSend = getUserID;
    } else {
      userIdSend = userIdSing;
    }
    super.initState();
    // ignore: avoid_print
    print(addSend);
    // ignore: avoid_print
    print(tokSend);
    // ignore: avoid_print
    print(userIdSend);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: sendState,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'The receive address does not empty';
              }
              return null;
            },
            controller: _qr,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    _qr.clear();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  )),
              labelText: 'To',
              labelStyle: TextStyle(fontSize: 16.sp, color: Colors.grey),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  borderSide: BorderSide(color: Colors.white, width: 2.w)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  borderSide: BorderSide(color: Colors.white, width: 2.w)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.w,
                ),
              ),
            ),
            onFieldSubmitted: (value) {
              _qr.text = value;
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: 275.w,
            height: 225.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.white, width: 2.w)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 70.w,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(horizontal: 75.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.blue.shade900,
                      ),
                      child: DropdownButton(
                        iconSize: 25,
                        underline: const Divider(),
                        borderRadius: BorderRadius.circular(10.r),
                        isDense: true,
                        isExpanded: true,
                        style: TextStyle(fontSize: 16.sp),
                        dropdownColor: Colors.blue.shade900,
                        iconEnabledColor: Colors.white,
                        items: ['Sol', 'J']
                            .map((e) => DropdownMenuItem(
                                  alignment: AlignmentDirectional.center,
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          setState(() {
                            payment = value!;
                          });
                        },
                        value: payment,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    TextField(
                      controller: _coin,
                      style: TextStyle(color: Colors.white, fontSize: 30.sp),
                      decoration: InputDecoration.collapsed(
                          hintText: '0',
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 30.sp)),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (payment == 'Sol')
                          if (coin.length > 1 &&
                              coin[1] == 556 &&
                              usdt.length > 1)
                            Text(
                              // ignore: prefer_if_null_operators
                              'Balance : ${usdt.length > 1 ? usdt[1] : '0'}  SOL',
                              style: TextStyle(fontSize: 18.sp),
                            )
                          else if (coin.length > 2 &&
                              coin[2] == 556 &&
                              usdt.length > 2)
                            Text(
                              // ignore: prefer_if_null_operators
                              'Balance : ${usdt.length > 2 ? usdt[2] : '0'}  SOL',
                              style: TextStyle(fontSize: 18.sp),
                            )
                          else if (usdt.isEmpty)
                            Text(
                              'Balance : 0  SOL',
                              style: TextStyle(fontSize: 18.sp),
                            )
                          else
                            Text(
                              'Balance : 0  SOL',
                              style: TextStyle(fontSize: 18.sp),
                            )
                        else if (coin.length > 1 &&
                            coin[1] == 563 &&
                            usdt.length > 1)
                          Text(
                            // ignore: prefer_if_null_operators
                            'Balance : ${usdt.length > 1 ? usdt[1] : '0'}  J',
                            style: TextStyle(fontSize: 18.sp),
                          )
                        else if (coin.length > 2 &&
                            coin[2] == 563 &&
                            usdt.length > 2)
                          Text(
                            // ignore: prefer_if_null_operators
                            'Balance : ${usdt.length > 2 ? usdt[2] : '0'}  J',
                            style: TextStyle(fontSize: 18.sp),
                          )
                        else if (usdt.isEmpty)
                          Text(
                            'Balance : 0  J',
                            style: TextStyle(fontSize: 18.sp),
                          )
                        else
                          Text(
                            'Balance : 0  J',
                            style: TextStyle(fontSize: 18.sp),
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
              onPressed: () {
                qr = _qr.text;
                coinSend = _coin.text;
                var fromData = sendState.currentState;
                if (fromData!.validate()) {
                  sendCoin(context);
                  // ignore: avoid_print
                  print('valid');
                  // ignore: avoid_print
                  print(qr);
                  // ignore: avoid_print
                  print(coinSend);
                } else {
                  // ignore: avoid_print
                  print('not valid');
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  elevation: 0,
                  fixedSize: Size(250.w, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23.w),
                  )),
              child: Text(
                'Finsh',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              )),
        ],
      ),
    );
  }
}
