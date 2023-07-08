import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/page_wallet/home_wallet/home_wallet.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      textColor: Colors.white,
      iconColor: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 55.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.blue.shade900),
                    onPressed: () {
                      Navigator.pushNamed(context, 'sendCoin');
                    },
                    child: const Icon(
                      Icons.arrow_outward,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 55.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.blue.shade900),
                    onPressed: () {
                      Navigator.pushNamed(context, 'receivePublicKey');
                    },
                    child: const Icon(
                      Icons.arrow_downward,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 55.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.blue.shade900),
                    onPressed: () {
                      Navigator.pushNamed(context, 'buyCoin').then((_) {
                        setState(() {
                          // walletCoin();
                        });
                        setState(() {
                          const HomeWallet();
                        });
                      });
                    },
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 55.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.blue.shade900),
                    onPressed: () {
                      Navigator.pushNamed(context, 'swapusdt');
                    },
                    child: const Icon(
                      Icons.currency_exchange_sharp,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                'send',
                style: TextStyle(fontSize: 18.sp),
                textAlign: TextAlign.center,
              )),
              Expanded(
                child: Text(
                  'Receive',
                  style: TextStyle(fontSize: 18.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                  child: Text(
                'Buy',
                style: TextStyle(fontSize: 18.sp),
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                'Swap',
                style: TextStyle(fontSize: 18.sp),
                textAlign: TextAlign.center,
              ))
            ],
          ),
        ],
      ),
    );
  }
}
