import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';
import 'package:j_wallet/view/page_wallet/home_wallet/homewallet_bottom.dart';

final GlobalKey<FormState> _fromState = GlobalKey<FormState>();

class SwapUsdt extends StatefulWidget {
  const SwapUsdt({super.key});

  @override
  State<SwapUsdt> createState() => _SwapUsdtState();
}

String amount = '';
var m = 'Solana';

class _SwapUsdtState extends State<SwapUsdt> {
  final TextEditingController _ammount = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (usdt.isNotEmpty) {
      _ammount.text = usdt[0].toString();
    } else {
      _ammount.text = '0';
    }
    return Scaffold(
        appBar: const CustomAppbar(title: 'Swap'),
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
                    height: 10.h,
                  ),
                  Text(
                    'Enter an amount USDT to swap coins then continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Chosse The coins :   ',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      Container(
                        width: 150.w,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        // margin: EdgeInsets.symmetric(horizontal: 75.w),
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
                          items: ['Solana', 'J']
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
                              m = value!;
                            });
                          },
                          value: m,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  m == 'Solana'
                      ? TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 15.r),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'SOL',
                                    style: TextStyle(
                                        fontSize: 18.sp, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            label: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text(
                                'Solana',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
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
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 15.r),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'J',
                                    style: TextStyle(
                                        fontSize: 18.sp, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            label: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text(
                                'J Coins',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
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
                                ),
                              ),
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
                  TextFormField(
                    readOnly: true,
                    controller: _ammount,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Amount cannot be empty.';
                      } else if (value.contains('0.000')) {
                        return 'Invalid amount';
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
                              'USDT',
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
                            amount = _ammount.text;
                            Navigator.pushNamed(context, 'swapsol');
                            // ignore: avoid_print
                            print('Valid');
                            // ignore: avoid_print
                            print(amount);
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
        ));
  }
}
