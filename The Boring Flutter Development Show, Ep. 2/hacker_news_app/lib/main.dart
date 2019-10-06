import 'package:flutter/material.dart';
import 'src/Article.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

void main() => runApp(MyApp());

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
  List<Article> _articles = articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new RefreshIndicator(
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 3));
          setState(() {
            _articles.removeAt(0);
          });
        },
        child: ListView(
          children: _articles.map(_buildItem).toList(),
        ),
      ),
    );
  }

  Widget _buildItem(Article e) {
    return Padding(
      // key: Key(e.by),s
      padding: const EdgeInsets.all(14.0),
      child: new ExpansionTile(
        title: new Text(
          e.text,
          style: new TextStyle(fontSize: 22),
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                "${e.commentsCount} comments",
              ),
              new MaterialButton(
                // onPressed: () {},
                onPressed: () async {
                  final fakeUrl = "http://${e.domain}";
                  if (await canLaunch(fakeUrl)) {
                    launch(fakeUrl);
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
