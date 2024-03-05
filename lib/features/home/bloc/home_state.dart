import 'package:news_app/features/home/models/news_model.dart';

abstract class NewsState {}

class HomeInitialState extends NewsState {}

class HomeLoadingState extends NewsState {
  HomeLoadingState();
}

class NewsSuccessState extends NewsState {
  final List<NewsModel> topHeadlines;
  final List<NewsModel> bbcNews;
  final List<NewsModel> bitCoin;
  final List<NewsModel> techCrunch;

  NewsSuccessState({
    required this.topHeadlines,
    required this.bbcNews,
    required this.bitCoin,
    required this.techCrunch,
  });
}

class NewsErrorState extends NewsState {
  final String error;
  NewsErrorState({required this.error});
}
