import 'dart:collection';

import 'package:ep3/src/hn_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ep3/src/Article.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  final hunBloc = HackerNewsBloc();
  runApp(MyApp(bloc: hunBloc));
}

class MyApp extends StatelessWidget {
  final HackerNewsBloc bloc;
  MyApp({
    Key key,
    this.bloc,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', bloc: bloc),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final HackerNewsBloc bloc;
  MyHomePage({Key key, this.title, this.bloc}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<UnmodifiableListView<Article>>(
        stream: widget.bloc.articles,
        builder: (context, snapshot) {
          return ListView(
            children: snapshot.data.map((e) => _buildItem(e)).toList(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_drop_up),
            title: Text("Top stories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            title: Text("New stories"),
          )
        ],
        onTap: (index) {
          if (index == 0) {
            widget.bloc.storiesType.add(StoriesType.topStories);
          } else {
            widget.bloc.storiesType.add(StoriesType.newStories);
          }
        },
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
