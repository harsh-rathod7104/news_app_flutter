import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/models/news_model.dart';
import 'package:news_app/features/home/screens/news_detail_screen.dart';
import 'package:news_app/features/home/widgets/all_news_screen_appbar.dart';
import 'package:news_app/features/home/widgets/home_widgets/single_news.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ViewAllNewsScreen extends StatelessWidget {
  final List<NewsModel> newsList;
  const ViewAllNewsScreen({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.5,
          toolbarHeight: 60.h,
          automaticallyImplyLeading: false,
          title: const AllNewsAppBar(),
        ),
        body: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            final NewsModel news = newsList[index];
            return GestureDetector(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(context,
                    screen: NewsDetailScreen(news: news),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino);
              },
              child: SingleNews(news: news),
            );
          },
        ));
  }
}
