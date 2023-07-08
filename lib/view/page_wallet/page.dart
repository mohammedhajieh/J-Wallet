import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';
import 'package:j_wallet/view/component/custom_bottomnavigationbar.dart';
import 'package:j_wallet/view/page_wallet/coin_price/home_price.dart';
import 'package:j_wallet/view/page_wallet/home_wallet/home_wallet.dart';
import 'package:j_wallet/view/page_wallet/transfer/home_transfer.dart';

class PageWallet extends StatefulWidget {
  const PageWallet({super.key});

  @override
  State<PageWallet> createState() => _PageWalletState();
}

class _PageWalletState extends State<PageWallet> {
  int index = 1;
  final List<Widget> _pages = [
    const HomePrice(),
    const HomeWallet(),
    const HomeTransfer(),
  ];
  final List<String> _title = ['Coinprice', 'J-Wallet', 'Transfer'];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        icon: IconButton(
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
          icon: Icon(
            Icons.menu,
            color: Colors.blue.shade900,
          ),
        ),
        title: _title[index],
      ),
      body: Container(
        width: double.infinity.w,
        height: double.infinity.w,
        color: Colors.black,
        child: _pages[index],
      ),
      bottomNavigationBar: CustomBottomNavigationbar(
        index: index,
        function: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
