import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:j_wallet/model/coinprice_model.dart';

class HomePrice extends StatefulWidget {
  const HomePrice({super.key});

  @override
  State<HomePrice> createState() => _HomePriceState();
}

class _HomePriceState extends State<HomePrice> {
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: coinList.isEmpty
          ? CircularProgressIndicator(
              color: Colors.blue.shade900,
            )
          : ListView.builder(
              itemCount: coinList.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.blue.shade900, width: 2.w),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: ListTile(
                        leading: Image(
                          image: NetworkImage('${coinList[index].image}'),
                          fit: BoxFit.fill,
                        ),
                        title: Text(
                          '${coinList[index].fullName}',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        subtitle: Text(
                          '${coinList[index].nickName}',
                          style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                        ),
                        trailing: Text(
                          '${coinList[index].coinprice} \$ ',
                          style: TextStyle(fontSize: 18.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
