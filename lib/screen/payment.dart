import 'dart:async';
import 'dart:io';
import 'package:ara_optical_app/const.dart';
import 'package:ara_optical_app/model/config.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ara_optical_app/model/user.dart';

class PaymentPage extends StatefulWidget {
  final User user;
  final double total;

  const PaymentPage({Key? key, required this.user, required this.total})
      : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late double screenHeight, screenWidth, resWidth;
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 600) {
      resWidth = screenWidth;
    } else {
      resWidth = screenWidth * 0.75;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Billing'),
        backgroundColor: kPrimayColor,
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: WebView(
            initialUrl: Config.server +
                '/araoptical/php/payment.php?email=' +
                widget.user.email.toString() +
                '&name=' +
                widget.user.name.toString() +
                '&amount=' +
                widget.total.toString(),
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onProgress: (int progress) {
              print('WebView is loading (progress : $progress%)');
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
          ),
        ),
      ),
    );
  }
}
