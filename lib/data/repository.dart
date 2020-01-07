import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_flutter_app/model/model.dart';

class Repository {
  static const String API_KEY = "10295c24ac0c456d87a3e61ddbeb4212";
  static const String NEWS_TOPIC = "us";
  static const String PAGE = "1";
  static const String PAGE_SIZE = "40";

  Future<NewsResponse> fetchNews() async {
    final response = await http.get(
        'https://newsapi.org/v2/everything?q=$NEWS_TOPIC&sortBy=publishedAt&apiKey=$API_KEY&page=$PAGE&pageSize=$PAGE_SIZE');

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load...");
    }
  }
}
