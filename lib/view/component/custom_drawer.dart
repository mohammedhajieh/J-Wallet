import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:j_wallet/view/page_wallet/drawer_menu/menupage.dart';
import 'package:j_wallet/view/page_wallet/page.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final zoomDrawerController = ZoomDrawerController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: const MenuPage(),
      mainScreen: const PageWallet(),
      showShadow: false,
      style: DrawerStyle.defaultStyle,
      borderRadius: 25.0.r,
      angle: 0,
      moveMenuScreen: false,
      menuBackgroundColor: Colors.blue.shade900,
      drawerShadowsBackgroundColor: Colors.blue.shade900,
      slideWidth: MediaQuery.of(context).size.width * .65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.decelerate,
      mainScreenTapClose: true,
      duration: const Duration(milliseconds: 300),
      mainScreenScale: 0.2,
    );
  }
}
