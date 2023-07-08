import 'package:flutter/material.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';
// ignore: must_be_immutable
class AppWebView extends StatelessWidget {
  AppWebView({required this.title, required this.url, super.key});

  final String title;
  final String url;
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    initializeController();
    return Scaffold(
      appBar: CustomAppbar(title: title),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }

  void initializeController() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            // ignore: avoid_print
            print('On page start');
          },
          onPageFinished: (String url) {
            // ignore: avoid_print
            print('on page finished');
          },
          onWebResourceError: (WebResourceError error) {
            // ignore: avoid_print
            print(' on page error $error');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }
}