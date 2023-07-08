import 'package:flutter/material.dart';
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key,required this.title,this.action,this.icon,});

  final String title;
  final List<Widget> ? action;
  final Widget ? icon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.blue.shade900),
      title: Text(title,style: TextStyle(color:Colors.blue.shade900),),
      centerTitle: true,
      backgroundColor: Colors.black,
      elevation: 0,
      actions: action,
      leading: icon,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}