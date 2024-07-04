import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoScreen extends StatelessWidget {
  static const String route  = "VideoScreen";
  final String link;
  final String episode;
  const VideoScreen({super.key,required this.link,required this.episode});

  @override
  Widget build(BuildContext context) {
    return WebViewScreen(linkEmbed: link,name: episode,);
  }
}
class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
  final String linkEmbed,name;
  WebViewScreen({required this.linkEmbed,required this.name});
  
  
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _controller;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.linkEmbed));
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Tập ${widget.name}'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 1000, // Đặt chiều cao cố định cho WebView
              child: WebViewWidget(
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
