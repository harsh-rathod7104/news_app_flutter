import 'package:flutter/material.dart';
import 'package:news_app/features/home/models/news_model.dart';
import 'package:news_app/features/home/screens/news_detail_screen.dart';
import 'package:news_app/features/home/widgets/home_widgets/single_news.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class RecommendedNews extends StatelessWidget {
  final List<NewsModel> recommendedNewsList;
  const RecommendedNews({super.key, required this.recommendedNewsList});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: recommendedNewsList.length,
      itemBuilder: (context, index) {
        final NewsModel recommendNews = recommendedNewsList[index];
        return GestureDetector(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(context,
                withNavBar: false,
                screen: NewsDetailScreen(news: recommendNews));
          },
          child: SingleNews(news: recommendNews),
        );
      },
    );
  }
}
