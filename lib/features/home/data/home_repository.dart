import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app/features/home/models/news_model.dart';
import 'package:news_app/utils/api_base.dart';

class HomeRespository {
  // To Fetch  Single category news
  Future<List<NewsModel>> fetchNews(String category) async {
    log("fetching...");
    final response = await http.get(Uri.parse(category));
    log("fetching complete");

    if (response.statusCode == 200) {
      log("response okay");
      final decodedData = json.decode(response.body)['articles'] as List;
      log("creating object");
      return decodedData.map((news) => NewsModel.fromJson(news)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }

  //To fetch all categories's news
  Future<List<List<NewsModel>>> fetchAllNews() async {
    final List<Future<List<NewsModel>>> futures = [];
    final List<String> apiEndPoins = [
      ApiUrls.topHeadlines,
      ApiUrls.bbcNews,
      ApiUrls.bitCoins,
      ApiUrls.techCrunch,
    ];

    for (var category in apiEndPoins) {
      final response = fetchNews(category);
      futures.add(response);
    }

    try {
      final List<List<NewsModel>> results = await Future.wait(futures);

      return results;
    } catch (e) {
      throw Exception(e);
    }
  }
}
