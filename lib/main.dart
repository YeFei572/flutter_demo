import 'package:demo01/pages/flutter_html_demo.dart';
import 'package:demo01/pages/html_parser_demo.dart';
import 'package:demo01/pages/md5_file_demo.dart';
import 'package:demo01/pages/rich_text_demo.dart';
import 'package:demo01/pages/url_launcher_demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:html/dom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        '/toDemo01': (BuildContext context) => new HtmlParserDemo(),
        '/toDemo02': (BuildContext context) => new RichTextDemo(),
        '/toDemo03': (BuildContext context) => new Md5FileDemo(),
        '/toDemo04': (BuildContext context) => new FlutterHtmlDemo(),
        '/toDemo05': (BuildContext context) => new UrlLauncherDemo(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is cal
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Center(
            child: Column(
              children: [
                FlatButton(
                  child: Text(
                    'html解析DEMO',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.pinkAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, "/toDemo01");
                  },
                ),
                FlatButton(
                  child: Text(
                    '富文本DEMO',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.pink,
                  onPressed: () {
                    Navigator.pushNamed(context, "/toDemo02");
                  },
                ),
                FlatButton(
                  child: Text(
                    'MD5文件加密',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.pink,
                  onPressed: () {
                    Navigator.pushNamed(context, "/toDemo03");
                  },
                ),
                FlatButton(
                  child: Text(
                    'HTML解析',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.pink,
                  onPressed: () {
                    Navigator.pushNamed(context, "/toDemo04");
                  },
                ),FlatButton(
                  child: Text(
                    'URL_LAUNCHER解析',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.pink,
                  onPressed: () {
                    Navigator.pushNamed(context, "/toDemo05");
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
