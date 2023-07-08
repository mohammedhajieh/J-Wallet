import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:j_wallet/view/component/secretphrase_data.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:j_wallet/view/create_account/createaccount_body.dart';
import 'package:http/http.dart' as http;
import 'package:j_wallet/view/import_wallet/importwallet_body.dart';
import 'package:j_wallet/view/login_account/login_body.dart';
import 'package:j_wallet/view/page_wallet/drawer_menu/text_name.dart';
import 'package:j_wallet/view/page_wallet/home_wallet/homewallet_bottom.dart';
import 'package:j_wallet/view/page_wallet/transfer/home_transfer.dart';

class SecretPhraseBody extends StatefulWidget {
  const SecretPhraseBody({super.key});

  @override
  State<SecretPhraseBody> createState() => _SecretPhraseBodyState();
}

String tokenRegister = '';
List<String> _m = [];
String hh = '';
String address = '';
String check = '';
// ignore: prefer_typing_uninitialized_variables
var userIdSing;
Future<void> registerWallet() async {
  // Define the API endpoint URL
  const String apiUrl = 'http://10.0.2.2:5170/api/Auth/RegisterWallet';
  // Create a JSON payload to send in the request body
  final Map<String, dynamic> data = {
    // 'name': 'John Doe',
    // 'email': 'john.doe@example.com',
    'password': getPass,
    'secretPhrase': _m.join(','),
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
      var responseData = json.decode(response.body);
      address = responseData['walletAddress'];
      var responseData1 = json.decode(response.body);
      tokenRegister = responseData1['token'];
      var responseData2 = json.decode(response.body);
      userIdSing = responseData2['userid'];
      // Request was successful
      // ignore: avoid_print
      print('POST request successful');
      // ignore: avoid_print
      print(response.body);
      // ignore: avoid_print
      print(address);
      // ignore: avoid_print
      print(tokenRegister);
      // ignore: avoid_print
      print(userIdSing);
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

Response? response;
Future<void> checkPhrase() async {
  // Define the API endpoint URL
  const String apiUrl = 'http://10.0.2.2:5170/api/Auth/CheckPhrase';
  // Create a JSON payload to send in the request body
  final Map<String, dynamic> data = {
    // 'name': 'John Doe',
    // 'email': 'john.doe@example.com',
    "Phrase": _m.join(',')
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
      // Request was successful
      // ignore: avoid_print
      print('POST request successful');
      // ignore: avoid_print
      print(response!.body);
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

class _SecretPhraseBodyState extends State<SecretPhraseBody> {
  @override
  Widget build(BuildContext context) {
    String randomMnemonic = bip39.generateMnemonic();
    _m = randomMnemonic.split(' ');
    //ignore: avoid_print
    print(getPass);
    // ignore: avoid_print
    print(_m.join(','));
    checkPhrase();
    return Column(
      children: [
        Container(
          height: 370.h,
          width: double.infinity.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.white, width: 2.w)),
          child: ListView(
            children: [
              secretContainer(secret1: '1.${_m[0]}', secret2: '7.${_m[6]}'),
              secretContainer(secret1: '2.${_m[1]}', secret2: '8.${_m[7]}'),
              secretContainer(secret1: '3.${_m[2]}', secret2: '9.${_m[8]}'),
              secretContainer(secret1: '4.${_m[3]}', secret2: '10.${_m[9]}'),
              secretContainer(secret1: '5.${_m[4]}', secret2: '11.${_m[10]}'),
              secretContainer(secret1: '6.${_m[5]}', secret2: '12.${_m[11]}'),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: TextButton.icon(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: randomMnemonic),
                      ).then(
                        (value) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              '✓  Secret phrase copied to clipboard',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.blue.shade900,
                            behavior: SnackBarBehavior.floating,
                            duration: const Duration(milliseconds: 700),
                            margin: EdgeInsets.symmetric(
                                horizontal: 25.w, vertical: 65.h),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                          ));
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.copy,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Copy to clipboard',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        SizedBox(
          height: 50.h,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                if (response!.body == '{"success":"Not Found"}') {
                  registerWallet();
                  getaddressLogin = '';
                  addressImpoart = '';
                  getToken = '';
                  tokenImpoart = '';
                  getUserID = 0;
                  userID = 0;
                  usdt.clear();
                  recevieTransfer.clear();
                  sendTransfer.clear();
                  getName.text = '';
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      'termCondition', (Route<dynamic> route) => false);
                } else {
                  // ignore: avoid_print
                  print('The Secret Error');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.w),
                ),
              ),
              child: Text(
                'Go to account',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              )),
        ),
      ],
    );
  }
}
