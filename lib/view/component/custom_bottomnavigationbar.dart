import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationbar extends StatelessWidget {
  const CustomBottomNavigationbar(
      {super.key, required this.index, required this.function});

  final int index;
  final Function(int value) function;
  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      onItemSelected: function,
      containerHeight: 50.h,
      selectedIndex: index,
      itemCornerRadius: 24.r,
      curve: Curves.easeIn,
      showElevation: true,
      backgroundColor: Colors.black,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(
            Icons.price_change,
            size: 30,
          ),
          title: Text('coinprice', style: TextStyle(fontSize: 15.sp)),
          activeColor: Colors.blue.shade900,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(
            Icons.wallet,
            size: 30,
          ),
          title: Text('wallet', style: TextStyle(fontSize: 15.sp)),
          activeColor: Colors.blue.shade900,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(
            Icons.swap_horiz_sharp,
            size: 30,
          ),
          title: Text('transfer', style: TextStyle(fontSize: 15.sp)),
          activeColor: Colors.blue.shade900,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
