import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/import_wallet/importwallet_body.dart';
import 'package:j_wallet/view/login_account/login_body.dart';
import 'package:http/http.dart' as http;
import 'package:j_wallet/view/secret_phrase/secretphrase_body.dart';

class HomeTransfer extends StatefulWidget {
  const HomeTransfer({super.key});

  @override
  State<HomeTransfer> createState() => _HomeTransferState();
}

List recevieTransfer = [];
List sendTransfer = [];
String ad = '';
String receiveAddSend = '';
int coSend = 0;
String feesSend = '';
String sendTime = '';
String sendAddRecive = '';
int coRecive = 0;
String feesRecive = '';
String sendTimeRecive = '';

class _HomeTransferState extends State<HomeTransfer> {
  List ks = [];
  List zs = [];
  List ts = [];
  List cs = [];
  List kr = [];
  List zr = [];
  List tr = [];
  List cr = [];
  Future<void> transferIdRecive(int i) async {
    // ignore: avoid_print, prefer_typing_uninitialized_variables
    var url = Uri.parse(
        'http://10.0.2.2:5170/CheckTransaction?transactionId=${recevieTransfer[i]}');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var responseData1 = json.decode(response.body);
      if (responseData1['senderAddress'] != null) {
        setState(() {
          sendAddRecive = responseData1['senderAddress'];
          ks.add(sendAddRecive);
        });
      }
      var responseData2 = json.decode(response.body);
      if (responseData2['fees'] != null) {
        setState(() {
          feesRecive = responseData2['fees'];
          zs.add(feesRecive);
        });
      }
      var responseData3 = json.decode(response.body);
      if (responseData3['coinId'] != null) {
        setState(() {
          coRecive = responseData3['coinId'];
          cs.add(coRecive);
        });
      }
      var responseData4 = json.decode(response.body);
      if (responseData4['coinId'] != null) {
        setState(() {
          sendTimeRecive = responseData4['sendTime'];
          ts.add(sendTimeRecive);
        });
      }
      // ignore: avoid_print
      print(response.body);
    } else {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> transferIdSend(int i) async {
    // ignore: avoid_print, prefer_typing_uninitialized_variables
    var url = Uri.parse(
        'http://10.0.2.2:5170/CheckTransaction?transactionId=${sendTransfer[i]}');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var responseData1 = json.decode(response.body);
      if (responseData1['receiverAddress'] != null) {
        setState(() {
          receiveAddSend = responseData1['receiverAddress'];
          kr.add(receiveAddSend);
        });
      }
      var responseData2 = json.decode(response.body);
      if (responseData2['fees'] != null) {
        setState(() {
          feesSend = responseData2['fees'];
          zr.add(feesSend);
        });
      }
      var responseData3 = json.decode(response.body);
      if (responseData3['coinId'] != null) {
        setState(() {
          coSend = responseData3['coinId'];
          cr.add(coSend);
        });
      }
      var responseData4 = json.decode(response.body);
      if (responseData4['sendTime'] != null) {
        setState(() {
          sendTime = responseData4['sendTime'];
          tr.add(sendTime);
        });
      }
      // ignore: avoid_print
      print(response.body);
    } else {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> transferRecive() async {
    // ignore: avoid_print
    var url = Uri.parse('http://10.0.2.2:5170/WalletReceiveTransactions/$ad');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var responseData1 = json.decode(response.body);
      if (responseData1['transactionId'] != null) {
        setState(() {
          recevieTransfer = responseData1['transactionId'];
        });
      }
      // ignore: avoid_print
      print(response.body);
    } else {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> transferSend() async {
    // ignore: avoid_print
    var url = Uri.parse('http://10.0.2.2:5170/WalletSendTransactions/$ad');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var responseData1 = json.decode(response.body);
      if (responseData1['transactionId'] != null) {
        setState(() {
          sendTransfer = responseData1['transactionId'];
        });
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
    ts.clear();
    ks.clear();
    zs.clear();
    cs.clear();
    tr.clear();
    kr.clear();
    zr.clear();
    cr.clear();
    if (address.isNotEmpty) {
      ad = address;
    } else if (addressImpoart.isNotEmpty) {
      ad = addressImpoart;
    } else {
      ad = getaddressLogin;
    }
    super.initState();
    transferSend().then((_) async {
      for (int i = 0; i < sendTransfer.length; i++) {
        await transferIdSend(i);
      }
    });
    transferRecive().then((_) async {
      for (int i = 0; i < recevieTransfer.length; i++) {
        await transferIdRecive(i);
      }
    });
    // ignore: avoid_print
    print(sendTransfer);
    // ignore: avoid_print
    print(recevieTransfer);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Column(
            children: [
              TabBar(
                  labelColor: Colors.blue.shade900,
                  labelStyle: TextStyle(fontSize: 16.sp),
                  indicatorColor: Colors.blue.shade900,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.arrow_outward,
                        color: Colors.blue.shade900,
                        size: 30,
                      ),
                      text: 'Send',
                    ),
                    Tab(
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.blue.shade900,
                        size: 30,
                      ),
                      text: 'Receive',
                    ),
                  ]),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: TabBarView(children: [
                    sendTransfer.isEmpty
                        ? Center(
                            child: Text(
                            'You have no transactions',
                            style: TextStyle(
                                fontSize: 18.sp, color: Colors.blue.shade900),
                          ))
                        : ListView.builder(
                            itemCount: sendTransfer.length,
                            itemBuilder: (context, index) {
                              if (index < kr.length &&
                                  index < zr.length &&
                                  index < cr.length &&
                                  index < tr.length) {
                                return Column(
                                  children: [
                                    Column(
                                      children: [
                                        Card(
                                          elevation: 5,
                                          color: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors.blue.shade900,
                                                  width: 2.w),
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                          child: ListTile(
                                            leading: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                    radius: 20.r,
                                                    backgroundColor:
                                                        Colors.blue.shade900,
                                                    child: const Icon(
                                                      Icons.arrow_outward,
                                                      color: Colors.white,
                                                      size: 25,
                                                    )),
                                              ],
                                            ),
                                            title: Text(
                                              'Send',
                                              style: TextStyle(fontSize: 18.sp),
                                            ),
                                            subtitle: Text(
                                              'To: \n${kr[index]}',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.grey),
                                            ),
                                            trailing: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                cr[index] == 556
                                                    ? Text(
                                                        '${zr[index].substring(0, 6)} SOL\n ${tr[index].substring(0, 10)}',
                                                        style: TextStyle(
                                                            fontSize: 16.sp),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )
                                                    : Text(
                                                        '${zr[index].substring(0, 6)} J\n${tr[index].substring(0, 10)}',
                                                        style: TextStyle(
                                                            fontSize: 16.sp),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                              return null;
                            }),
                    recevieTransfer.isEmpty
                        ? Center(
                            child: Text(
                            'You have no transactions',
                            style: TextStyle(
                                fontSize: 18.sp, color: Colors.blue.shade900),
                          ))
                        : ListView.builder(
                            itemCount: recevieTransfer.length,
                            itemBuilder: (context, index) {
                              if (index < ks.length &&
                                  index < zs.length &&
                                  index < cs.length &&
                                  index < ts.length) {
                                return Column(
                                  children: [
                                    Card(
                                      elevation: 5,
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.blue.shade900,
                                              width: 2.w),
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      child: ListTile(
                                        leading: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                                radius: 20.r,
                                                backgroundColor:
                                                    Colors.blue.shade900,
                                                child: const Icon(
                                                  Icons.arrow_downward,
                                                  color: Colors.white,
                                                  size: 25,
                                                )),
                                          ],
                                        ),
                                        title: Text(
                                          'Receive',
                                          style: TextStyle(fontSize: 18.sp),
                                        ),
                                        subtitle: Text(
                                          'From: \n${ks[index]}',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.grey),
                                        ),
                                        trailing: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            cs[index] == 556
                                                ? Text(
                                                    '${zs[index].substring(0, 6)} SOL\n ${ts[index].substring(0, 10)}',
                                                    style: TextStyle(
                                                        fontSize: 16.sp),
                                                    textAlign: TextAlign.center,
                                                  )
                                                : Text(
                                                    '${zs[index].substring(0, 6)} J\n${ts[index].toString().substring(0, 10)}',
                                                    style: TextStyle(
                                                        fontSize: 16.sp),
                                                    textAlign: TextAlign.center,
                                                  )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return null;
                            })
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
