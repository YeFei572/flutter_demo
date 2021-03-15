import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class FlutterHtmlDemo extends StatefulWidget {
  @override
  _FlutterHtmlDemoState createState() => _FlutterHtmlDemoState();
}

class _FlutterHtmlDemoState extends State<FlutterHtmlDemo> {
  final String content = """
  <p><img src="http://192.168.88.250/api/mail/inline/cgi-bin/?f=88c82ff36b5b3dd05cf1c4b74ff52706"/></p>
  <p>123</p>
  <p>123</p>
  <p>123</p>
  <p>123</p>
  <p>123</p>
  <p>123</p>
  """;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Html(
            data: content,
            imageHeaders: {"Cookie": "_ga=GA1.1.789968174.1608784479; portainer.pagination_containers=50; token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN5c3RlbUBkaWthcnN6LmNvbSIsInVzZXJfaWQiOjI0MDUsInNoYXJlX3R5cGUiOiJhbGwiLCJzaGFyZSI6ZmFsc2UsIm9yaWdpbmFsX2lkIjoyNDA1LCJleHAiOjE2MTA2OTc1NjksInNpZyI6IkE0TUFJREFIM2hjYlFUejVVZFRxVVd1U1duNjNPbVRmY3RwN3MwUVFfVGRhSkVNdmE1eHBmS3pJSWxseVl2RWoiLCJlbWFpbCI6IiJ9.2Hv_zcsuknlaoGyChkziY1fv69OviR79CfeA1EXVghg"},
          ),
        )
      ),
    );
  }
}
