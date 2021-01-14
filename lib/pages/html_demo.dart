import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class HtmlDemo extends StatefulWidget {
  @override
  _HtmlDemoState createState() => _HtmlDemoState();
}

class _HtmlDemoState extends State<HtmlDemo> {
  /// 存放标签
  List<String> tags = [];

  /// 存放标签跳转路径
  List<String> tagUrls = [];

  @override
  void initState() {
    /// 初始化的时候将标签、标签路径清空
    this.tagUrls = [];
    this.tags = [];
    getPost();
    super.initState();
  }

  getPost() async {
    Dio dio = new Dio();
    // 发起请求获取首页的html数据
    Response res = await dio.get("https://juejin.cn/android");
    // 解析标签的值
    List titles = parse(res.data).querySelectorAll("li.nav-item > a ");
    // 添加标签到集合
    titles.forEach((element) {
      this.setState(() {
        this.tags.add(element.text.trim());
        this.tagUrls.add(element.attributes['href']);
      });
      print(element.text.trim() + ">>>>" + element.attributes['href']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // FlatButton(
            //   onPressed: Navigator.of(context).push(new Route()),
            // ),
            Wrap(
              runSpacing: 5,
              spacing: 4,
              children: List.generate(
                  tags.length,
                  (index) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.pinkAccent),
                        child: Text(
                          tags[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
