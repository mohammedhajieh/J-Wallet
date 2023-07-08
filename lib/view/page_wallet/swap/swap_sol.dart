import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/model/coinprice_model.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';
import 'package:http/http.dart' as http;
import 'package:j_wallet/view/import_wallet/importwallet_body.dart';
import 'package:j_wallet/view/login_account/login_body.dart';
import 'package:j_wallet/view/page_wallet/swap/swap_usdt.dart';
import 'package:j_wallet/view/secret_phrase/secretphrase_body.dart';

class SwapSol extends StatefulWidget {
  const SwapSol({super.key});

  @override
  State<SwapSol> createState() => _SwapSolState();
}

String wallet = '';
String to = '';

class _SwapSolState extends State<SwapSol> {
  Future<void> buyAndSell(BuildContext context) async {
    // Define the API endpoint URL
    const String apiUrl = 'http://10.0.2.2:5170/BuyandSell';
    // Create a JSON payload to send in the request body
    final Map<String, dynamic> data = {
      // 'name': 'John Doe',
      // 'email': 'john.doe@example.com',
      'token': to,
      'wallet': wallet,
      'existingCoinId': 562,
      'existingCoinAmount': 0,
      'newCoinId': m == 'Solana' ? 556 : 563,
      'newCoinAmount': m == 'Solana' ? _controller1.text : _controller2.text,
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
        // Request was successful
        // ignore: avoid_print
        print('POST request successful');
        // ignore: avoid_print
        print(response.body);
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
            context, 'goToAccount', (route) => false);
      } else {
        // Request failed
        // ignore: avoid_print
        print('POST request failed');
        // ignore: avoid_print
        print(response.body);
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
                'Insufficient balance of the existing coin',
                style: TextStyle(fontSize: 16.sp),
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

  Future<List<CoinPrica>> fetchCoin() async {
    coinList = [];
    final response =
        await http.get(Uri.parse('http://10.0.2.2:5170/GetLatestPrices'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      // ignore: prefer_is_empty
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(CoinPrica.fromJson(map));
          }
        }
        if (mounted) {
          setState(() {
            coinList;
          });
        }
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  late Timer timer;
  @override
  void initState() {
    if (getToken.isNotEmpty) {
      to = getToken;
    } else if (tokenImpoart.isNotEmpty) {
      to = tokenImpoart;
    } else {
      to = tokenRegister;
    }
    if (address.isNotEmpty) {
      wallet = address;
    } else if (addressImpoart.isNotEmpty) {
      wallet = addressImpoart;
    } else {
      wallet = getaddressLogin;
    }
    fetchCoin();
    timer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        if (mounted) {
          fetchCoin();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _controller.text = amount;
    if (coinList.length > 2) {
      var a = double.parse(amount) / (coinList[2].coinprice);
      var b = a.toStringAsFixed(4);
      _controller1.text = b.toString();
    }
    if (coinList.length > 9) {
      var a = double.parse(amount) / (coinList[9].coinprice);
      var b = a.toStringAsFixed(4);
      _controller2.text = b.toString();
    }
    return Scaffold(
      appBar: const CustomAppbar(title: 'Swap'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Center(
            child: coinList.isEmpty
                ? CircularProgressIndicator(
                    color: Colors.blue.shade900,
                  )
                : ListView(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Swap Usdt To ${m == 'Solana' ? 'Solana' : 'jCoins'}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      TextField(
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                        controller: _controller,
                        readOnly: true,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 15.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'USDT',
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          prefixIcon: Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 40.h,
                            width: 40.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  'https://i.pinimg.com/736x/dc/6b/78/dc6b788b83f0f536759f06f3854fc142.jpg'),
                              fit: BoxFit.cover,
                            )),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 20.h),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.w,
                            ),
                          ),
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
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      m == 'Solana'
                          ? TextField(
                              controller: _controller1,
                              readOnly: true,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(right: 15.r),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'SOL',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                prefixIcon: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: NetworkImage(
                                        'https://upload.wikimedia.org/wikipedia/en/b/b9/Solana_logo.png'),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 20.h),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2.w,
                                  ),
                                ),
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
                              ),
                            )
                          : TextField(
                              controller: _controller2,
                              readOnly: true,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(right: 15.r),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'J',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                prefixIcon: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/4-removebg-preview.png'),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 20.h),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2.w,
                                  ),
                                ),
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
                              buyAndSell(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade900,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(23.r),
                                )),
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 18.sp,
                              ),
                            )),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
