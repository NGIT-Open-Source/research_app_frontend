import 'dart:io';

import 'package:flutter/material.dart';
import 'package:researchapp/env.dart';

import '../widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebDICOM extends StatefulWidget {
  final String FileID;
  const WebDICOM({Key? key, required this.FileID}) : super(key: key);

  @override
  State<WebDICOM> createState() => _WebDICOMState();
}

class _WebDICOMState extends State<WebDICOM> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.FileID);
    return Scaffold(
      appBar: AppBarr,
      body: WebView(
        
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: WEB_VIEW + widget.FileID,
      ),
    );
  }
}
