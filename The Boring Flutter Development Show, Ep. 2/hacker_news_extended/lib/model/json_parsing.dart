// import 'dart:convert' as json;
import 'package:built_value/built_value.dart';
part 'built_vehicle.g.dart';
abstract class Article implements Built<Article, ArticleBuilder> {
  Article._();
  factory Article([updates(ArticleBuilder b)]) = _$Article;
}


//class Article {
//  final String text;
//  final String url;
//  final String by;
//  final String time;
//  final int score;
//
//  const Article({this.text, this.url, this.by, this.time, this.score});
//
//  factory Article.fromJson(Map<String, dynamic> json) {
//    if (json == null) {
//      return null;
//    }
//
//    return Article(
//        text: json['text'] ?? '[null]',
//        url: json['url'],
//        by: json['by'],
//        time: json['time'] ?? 0,
//        score: json['score']);
//  }
//}

// List<int> parseTopStories(String jsonStr) {
  // return [];
//  final parsed = json.jsonDecode(jsonStr);
//  final listOfIds = List<int>.from(parsed);
//  return listOfIds;
// }

// Article parseArticle(String jsonStr) {
  // return null;
  //  final parsed = json.jsonDecode(jsonStr);
//  Article article = Article.fromJson(parsed);
//  return article;
// }
