import 'package:flutter/material.dart';
import 'package:testing_flutter_app/article.dart';
import 'package:testing_flutter_app/news_service.dart';

class NewsChangeNotifier extends ChangeNotifier {
  final NewsService _newsService;

  NewsChangeNotifier(this._newsService);

  List<Article> _articles = [];

  List<Article> get articles => _articles;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getArticles() async {
    // TODO: Implement
    _isLoading = true;
    notifyListeners();
    _articles = await _newsService.getArticles();
    _isLoading = false;
    notifyListeners();
  }
}
