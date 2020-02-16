import 'package:ep3/src/Article.dart';
import 'package:rxdart/rxdart.dart';

class HackerNewsBloc {
  // Stream<List<Article>> get articles => _articlesSubject.stream;
  // final _articlesSubject = BehaviorSubject<List<Article>>();
  Stream<List<Article>> get articles => _articlesSubject.stream;
  final _articlesSubject = BehaviorSubject<List<Article>>();
}
