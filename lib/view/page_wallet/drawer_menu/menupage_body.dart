import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/custom_webview.dart';

class MenuPageBody extends StatelessWidget {
  const MenuPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      iconColor: Colors.white,
      textColor: Colors.white,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'goToAccount', (Route<dynamic> route) => false);
            },
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          SizedBox(
            height: 20.h,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, 'sendCoin');
            },
            leading: const Icon(Icons.arrow_outward),
            title: const Text('Send'),
          ),
          SizedBox(
            height: 20.h,
          ),
          ListTile(
            onTap: () {
              var route = MaterialPageRoute(
                builder: (context) => AppWebView(
                  title: 'Solscan',
                  url: 'https://solscan.io/',
                ),
              );
              Navigator.push(context, route);
            },
            leading: const Icon(Icons.remove_red_eye),
            title: const Text('View solscan'),
          ),
          SizedBox(
            height: 20.h,
          ),
          ListTile(
            onTap: () {
              var route = MaterialPageRoute(
                builder: (context) => AppWebView(
                  title: 'About us Solana',
                  url: 'https://solana.com/learn/blockchain-basics',
                ),
              );
              Navigator.push(context, route);
            },
            leading: const Icon(Icons.info),
            title: const Text('About us'),
          ),
          SizedBox(
            height: 20.h,
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Center(
                          child: Text(
                        'Logout',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.sp),
                      )),
                      content: Text(
                        'Do you really want to logout your wallet?',
                        style: TextStyle(fontSize: 18.sp),
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.blue.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      actions: [
                        const Divider(
                          thickness: 0.3,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'No',
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.white),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  'homepage',
                                  (route) => false,
                                );
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  });
            },
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
          ),
          DefaultTextStyle(
            style:
                TextStyle(fontSize: 12.sp, color: Colors.white70, height: 7.h),
            child: const Text(
              'Terms of Service | Privacy Policy',
            ),
          ),
        ],
      ),
    );
  }
}
