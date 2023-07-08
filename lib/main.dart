import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/acoount/account_screen.dart';
import 'package:j_wallet/view/component/custom_drawer.dart';
import 'package:j_wallet/view/create_account/create_wallet.dart';
import 'package:j_wallet/view/home_page.dart';
import 'package:j_wallet/view/import_wallet/import_wallet.dart';
import 'package:j_wallet/view/login_account/login_account.dart';
import 'package:j_wallet/view/page_wallet/buy_coin/amount.dart';
import 'package:j_wallet/view/page_wallet/buy_coin/buy.dart';
import 'package:j_wallet/view/page_wallet/drawer_menu/text_name.dart';
import 'package:j_wallet/view/page_wallet/receive_publickey/receive.dart';
import 'package:j_wallet/view/page_wallet/send_coin/send_coin.dart';
import 'package:j_wallet/view/page_wallet/swap/swap_sol.dart';
import 'package:j_wallet/view/page_wallet/swap/swap_usdt.dart';
import 'package:j_wallet/view/secret_phrase/secret_phrase.dart';
import 'package:j_wallet/view/terms_and_condition/terms_condition.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
            routes: {
              'swapsol': (context) => const SwapSol(),
              'swapusdt': (context) => const SwapUsdt(),
              'amount': (context) => const Amount(),
              'homepage': (context) => const HomePage(),
              'getStarted': (context) => const AccountScreen(),
              'createNewAccount': (context) => const CreateWallet(),
              'createPassword': (context) => const SecretPhrase(),
              'goToAccount': (context) => const DrawerScreen(),
              'textName': (context) => const TextName(),
              'importWallet': (context) => const ImportWallet(),
              'termCondition': (context) => const TermCondition(),
              'receivePublicKey': (context) => const ReceivePublicKey(),
              'sendCoin': (context) => const SendCoin(),
              'buyCoin': (context) => const CreditCardsPage(),
              'login': (context) => const LoginAccount(),
            },
          );
        },
        child: const HomePage());
  }
}
