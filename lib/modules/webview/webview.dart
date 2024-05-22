import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewer extends StatelessWidget {
  WebViewer({super.key, required this.url});
  final String url;

  late final WebViewController controller = WebViewController()
    ..loadRequest(
      Uri.parse(url),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}