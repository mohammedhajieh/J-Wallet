import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/page_wallet/drawer_menu/text_name.dart';

class MenuPageHeader extends StatefulWidget {
  const MenuPageHeader({super.key});

  @override
  State<MenuPageHeader> createState() => _MenuPageHeaderState();
}
class _MenuPageHeaderState extends State<MenuPageHeader> {
  @override
  void initState() {
    super.initState();
   if(getName.text.isEmpty){
      getName.text='Account';
      }else if(getName.text.length>12){
        getName.text='Account';
      }
      else{
      getName.text;
      }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120.h,
          width: 120.h,
          margin: const EdgeInsets.only(
          top: 24,
          left: 30
          ),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage('assets/image/j-wallet.png'),
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high
            ),
            color: Colors.white,
          ),
        ),
        SizedBox(height: 30.h,),
        Row(
          children: [
            SizedBox(width: 15.w,),
            Expanded(flex: 2,child: Text(getName.text,style: TextStyle(fontSize: 16.sp),maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)),
            Expanded(
              child: IconButton(onPressed: () {
                Navigator.pushNamed
                (context, 'textName').then((value) {
                  setState(() {
                    if(getName.text.isEmpty){
                       getName.text='Account';
                       }else if(getName.text.length>12){
                        getName.text='Account';
                        }
                       else{
                       getName.text;
                       }
                  });
                });
              }, 
              icon:const Icon(Icons.edit,color: Colors.white,)
              ),
            )
          ],
        ),
        SizedBox(height: 10.h,),
         const Divider(
          thickness: 0.2,
          color: Colors.white,
        ),
    ],
        );

  }
}