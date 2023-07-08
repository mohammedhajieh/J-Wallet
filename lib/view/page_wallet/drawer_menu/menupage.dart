import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/page_wallet/drawer_menu/menupage_body.dart';
import 'package:j_wallet/view/page_wallet/drawer_menu/menupage_header.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: SafeArea(
        child: ListView(
          children: [
            const MenuPageHeader(),
            SizedBox(height: 15.h,),
            const MenuPageBody()
          ],
        )
      )
    );
  }
}