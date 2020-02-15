import 'package:flutter/material.dart';
import 'src/Article.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

//Change in my newer branch and we are trying "merge"

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
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
  List<int> _ids = [
    21182705,
    21181664,
    21157404,
    21161233,
    21167871,
    21160238,
    21184623,
    21172686,
    21172936,
    21182628
  ];

  Future<Article> _getArticle(int id) async {
    final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final storyRes = await http.get(storyUrl);
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _ids
            .map((i) => FutureBuilder<Article>(
                  future: _getArticle(i),
                  builder:
                      (BuildContext context, AsyncSnapshot<Article> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return _buildItem(snapshot.data);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                    ;
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget _buildItem(Article e) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: new ExpansionTile(
        title: new Text(
          e.title,
          style: new TextStyle(fontSize: 22),
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                e.type,
              ),
              new MaterialButton(
                // onPressed: () {},
                onPressed: () async {
                  // final fakeUrl = "http://${e.domain}";
                  if (await canLaunch(e.url)) {
                    launch(e.url);
                  }
                },
                child: new Text("Open"),
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
