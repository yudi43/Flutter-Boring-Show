import 'dart:convert' as json;
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'serializers.dart';
import 'package:built_value/serializer.dart';
part 'Article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;
  int get id;
  @nullable
  bool get deleted;

  String get type;

  String get by;

  int get time;

  @nullable
  String get text;

  @nullable
  bool get dead;

  @nullable
  int get parent;

  @nullable
  int get poll;

  BuiltList<int> get kids;

  @nullable
  String get url;

  @nullable
  int get score;

  @nullable
  String get title;

  BuiltList<int> get parts;

  @nullable
  int get descendants;

  Article._();

  factory Article([updates(ArticleBuilder b)]) = _$Article;
}

 List<int> parseTopStories(String jsonStr) {
 return [];
  // final parsed = json.jsonDecode(jsonStr);
  // final listOfIds = List<int>.from(parsed);
  // return listOfIds;
 }

Article parseArticle(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  Article article = standardSerializers.deserializeWith(Article.serializer, parsed);
  return article;
}












// class Article {
//   final String text;
//   final String domain;
//   final String by;
//   final String age;
//   final int score;
//   final int commentsCount;

//   const Article({
//     this.text,
//     this.domain,
//     this.by,
//     this.age,
//     this.score,
//     this.commentsCount
//   });
// }

// final articles = [
//   new Article(
//     text: "Cylindrical shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Circular shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Circular shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Circular shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Cylindrical shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Circular shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Circular shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Circular shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Cylindrical shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Circular shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Circular shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Circular shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Cylindrical shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Circular shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Circular shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
//   new Article(
//     text: "Circular shock acoustic wasves in ionosphere triggered by launch of Formosat-5",
//     domain: "wiley.com",
//     by: "zdw",
//     age: "3 hours",
//     score: 81,
//     commentsCount: 128,
//   ),
//   new Article(
//     text: "Bmw says electric car mass production not viable till 2020",
//     domain: "reuters.com",
//     by: "Mononokay",
//     age: "2 hours",
//     score: 177,
//     commentsCount: 62,
//   ),
//   new Article(
//     text: "Evolution is the new deep learning ",
//     domain: "sentient.ai",
//     by: "jonbaer",
//     age: "4 hours",
//     score: 200,
//     commentsCount: 54,
//   ),
// ];