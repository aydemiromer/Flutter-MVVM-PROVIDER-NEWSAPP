import 'package:flutter/material.dart';
import 'package:news_mvvm/model/news_model.dart';
import 'package:news_mvvm/service/news_service.dart';

class NewsViewModel {
  News _news;

  NewsViewModel({News article}) : _news = article;

  String get title {
    return _news.title;
  }

  String get description {
    return _news.description;
  }

  String get imageUrl {
    return _news.urlToImage;
  }

  String get url {
    return _news.url;
  }

  String get author {
    return _news.author;
  }

  String get publishedAt {
    return _news.publishedAt;
  }

  String get content {
    return _news.content;
  }
}

class NewsListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<NewsViewModel> articles = List<NewsViewModel>.empty(growable: true);

  void topHeadlines() async {
    List<News> news = await NewsService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles =
        news.map((article) => NewsViewModel(article: article)).toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
  }
}

enum LoadingStatus { completed, searching, empty }
