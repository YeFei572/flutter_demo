import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class HtmlParserDemo extends StatefulWidget {
  @override
  _HtmlDemoState createState() => _HtmlDemoState();
}

class _HtmlDemoState extends State<HtmlParserDemo> {
  /// 存放标签
  List<String> tags = [];

  /// 存放标签跳转路径
  List<String> tagUrls = [];
  Map<String, String> headers = {};

  String cookie = "_ga=GA1.1.789968174.1608784479; portainer.pagination_containers=50; token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN5c3RlbUBkaWthcnN6LmNvbSIsInVzZXJfaWQiOjI0MDUsInNoYXJlX3R5cGUiOiJhbGwiLCJzaGFyZSI6ZmFsc2UsIm9yaWdpbmFsX2lkIjoyNDA1LCJleHAiOjE2MTA2ODU4OTIsInNpZyI6IkE0TUFJREFIM2hjYlFUejVVZFRxVVd1U1duNjNPbVRmY3RwN3MwUVFfVGRhSkVNdmE1eHBmS3pJSWxseVl2RWoiLCJlbWFpbCI6IiJ9.Gr3RErpQoqOFIsvwQeqP6N4Gs8thXg-gV5vc7iE4Bs0";


  @override
  void initState() {
    /// 初始化的时候将标签、标签路径清空
    this.tagUrls = [];
    this.tags = [];
    getPost();
    // headers['Cookie'] = cookie;
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
            CachedNetworkImage(
              imageUrl: 'http://192.168.88.250/api/mail/inline/cgi-bin/?f=7eec530b33c9e7ef2c41be48107ca766',
              httpHeaders: this.headers,
              width: 600,
              height: 580,
            )
          ],
        ),
      ),
    );
  }
}
