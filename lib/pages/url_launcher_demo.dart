import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherDemo extends StatefulWidget {
  @override
  _UrlLauncherDemoState createState() => _UrlLauncherDemoState();
}

class _UrlLauncherDemoState extends State<UrlLauncherDemo> {

  final String fileUrl = "http://192.168.88.250/api/v1/message/attachment/?raw_name=INBOX&uid=552&sid=1";
  final String token = "JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imh1YWNoZW5nQGRpa2Fyc3ouY29tIiwidXNlcl9pZCI6MjQwOSwic2hhcmVfdHlwZSI6ImFsbCIsInNoYXJlIjpmYWxzZSwib3JpZ2luYWxfaWQiOjI0MDksImV4cCI6MTYxNTgwNDY5NCwic2lnIjoidmtXTC1PR1U5c1lrYzNOWHJsN0F3SmRldzhlQTBHaXY4Zm9ES195YU5KT2lTZU9nazdZOXBfYnNwTDd0RVR5MSIsImVtYWlsIjoiIn0.PWO5kvIuicXF4IjPgPm6-BjD6obdUYHpKB7cuNW30lM";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: FlatButton(
                color: Colors.pinkAccent,
                onPressed: () async {
                  if (await canLaunch(fileUrl)) {
                  await launch(fileUrl, headers: <String, String>{'Authorization': token});
                  } else {
                  throw 'Could not launch $fileUrl';
                  }
                },
                child: Text("测试URL_LAUNCHER"),
              ),
            ),
            Text(fileUrl)
          ],
        )
      ),
    );
  }
}
