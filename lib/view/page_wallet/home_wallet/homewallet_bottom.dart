import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:j_wallet/view/import_wallet/importwallet_body.dart';
import 'package:j_wallet/view/login_account/login_body.dart';
import 'package:j_wallet/view/secret_phrase/secretphrase_body.dart';

class HomeWalletBottom extends StatefulWidget {
  const HomeWalletBottom({super.key});

  @override
  State<HomeWalletBottom> createState() => _HomeWalletBottomState();
}

String add = '';
List usdt = [];
List coin = [];

class _HomeWalletBottomState extends State<HomeWalletBottom> {
  Future<void> walletCoin() async {
    // ignore: avoid_print
    print(add);
    var url = Uri.parse('http://10.0.2.2:5170/CheckWalletCoins/$add');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var responseData1 = json.decode(response.body);
      var responseData2 = json.decode(response.body);
      if (responseData1['amounts'] != null) {
        setState(() {
          usdt = List.from(responseData1['amounts']);
        });
        if (responseData2['coins'] != null) {
          setState(() {
            coin = List.from(responseData1['coins']);
          });
        }
      }
      // ignore: avoid_print
      print(response.body);
    } else {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    if (address.isNotEmpty) {
      add = address;
    } else if (addressImpoart.isNotEmpty) {
      add = addressImpoart;
    } else {
      add = getaddressLogin;
    }
    walletCoin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.black,
        border: Border.all(color: Colors.white, width: 2.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/en/b/b9/Solana_logo.png'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10.w,
                ),
                // ignore: prefer_is_empty
                if (coin.length > 0 && coin[0] == 556 && usdt.length > 0)
                  Text(
                    // ignore: prefer_if_null_operators
                    '${usdt.length > 1 ? usdt[1] : '0'}  SOL',
                    style: TextStyle(fontSize: 18.sp),
                  )
                else if (coin.length > 1 && coin[1] == 556 && usdt.length > 1)
                  Text(
                    // ignore: prefer_if_null_operators
                    '${usdt.length > 1 ? usdt[1] : '0'}  SOL',
                    style: TextStyle(fontSize: 18.sp),
                  )
                else if (coin.length > 2 && coin[2] == 556 && usdt.length > 2)
                  Text(
                    // ignore: prefer_if_null_operators
                    '${usdt.length > 2 ? usdt[2] : '0'}  SOL',
                    style: TextStyle(fontSize: 18.sp),
                  )
                else if (usdt.isEmpty)
                  Text(
                    '0  SOL',
                    style: TextStyle(fontSize: 18.sp),
                  )
                else
                  Text(
                    '0  SOL',
                    style: TextStyle(fontSize: 18.sp),
                  )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/image/4-removebg-preview.png'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10.w,
                ),
                // ignore: prefer_is_empty
                if (coin.length > 0 && coin[0] == 563 && usdt.length > 0)
                  Text(
                    // ignore: prefer_if_null_operators, prefer_is_empty
                    '${usdt.length > 0 ? usdt[0] : '0'}  J',
                    style: TextStyle(fontSize: 18.sp),
                  )
                else if (coin.length > 1 && coin[1] == 563 && usdt.length > 1)
                  Text(
                    // ignore: prefer_if_null_operators
                    '${usdt.length > 1 ? usdt[1] : '0'}  J',
                    style: TextStyle(fontSize: 18.sp),
                  )
                else if (coin.length > 2 && coin[2] == 563 && usdt.length > 2)
                  Text(
                    // ignore: prefer_if_null_operators
                    '${usdt.length > 2 ? usdt[2] : '0'}  J',
                    style: TextStyle(fontSize: 18.sp),
                  )
                else if (usdt.isEmpty)
                  Text(
                    '0  J',
                    style: TextStyle(fontSize: 18.sp),
                  )
                else
                  Text(
                    '0  J',
                    style: TextStyle(fontSize: 18.sp),
                  )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Container(
                  height: 45.h,
                  width: 45.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cryptologos.cc/logos/tether-usdt-logo.png'),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  width: 10.w,
                ),
                // ignore: unnecessary_type_check, prefer_is_empty
                if (usdt is List && usdt.length > 0 && coin[0] == 562)
                  Text(
                    // ignore: prefer_if_null_operators
                    '${usdt[0] != null ? usdt[0] : '0'}  USDT',
                    style: TextStyle(fontSize: 18.sp),
                    // ignore: unnecessary_type_check
                  )
                // ignore: unnecessary_type_check
                else if (usdt is List && usdt.length > 1 && coin[1] == 562)
                  Text(
                    // ignore: prefer_if_null_operators
                    '${usdt[1] != null ? usdt[1] : '0'}  USDT',
                    style: TextStyle(fontSize: 18.sp),
                  )
                // ignore: unnecessary_type_check
                else if (usdt is List && usdt.length > 2 && coin[2] == 562)
                  Text(
                    // ignore: prefer_if_null_operators
                    '${usdt[2] != null ? usdt[2] : '0'}  USDT',
                    style: TextStyle(fontSize: 18.sp),
                  )
                else
                  Text(
                    '0  USDT',
                    style: TextStyle(fontSize: 18.sp),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
