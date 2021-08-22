import 'package:dio/dio.dart';
import 'package:news_mvvm/model/news_model.dart';

class NewsService {
  var dio = Dio();

  Future<List<News>> fetchTopHeadlines() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=pasteapikeyhere.";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => News.fromJson(article)).toList();
    } else {
      throw Exception("failed get news!");
    }
  }
}
