import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/bloc/carousel_bloc/carousel_bloc.dart';
import 'package:news_app/features/home/bloc/home_bloc.dart';
import 'package:news_app/features/home/bloc/home_state.dart';
import 'package:news_app/features/home/models/news_model.dart';
import 'package:news_app/features/home/screens/view_all_news_screen.dart';
import 'package:news_app/features/home/widgets/custom_heading.dart';
import 'package:news_app/features/home/widgets/home_widgets/home_appBar.dart';
import 'package:news_app/features/home/widgets/home_widgets/news_slider.dart';
import 'package:news_app/features/home/widgets/home_widgets/news_slider_indicator.dart';
import 'package:news_app/features/home/widgets/home_widgets/recommended_news_list.dart';

class HomeScreenUI extends StatelessWidget {
  const HomeScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarouselCubit(),
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _carouselController = CarouselController();
  List<NewsModel> topHeadlines = [];
  List<NewsModel> bbcNews = [];
  List<NewsModel> bitcoin = [];
  List<NewsModel> techCrunch = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HomeAppBar(),
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<HomeBloc, NewsState>(
        listener: (context, state) {
          if (state is NewsSuccessState) {
            topHeadlines = state.topHeadlines;
            bbcNews = state.bbcNews;
            bitcoin = state.bitCoin;
            techCrunch = state.techCrunch;
          }
          if (state is NewsErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return CustomScrollView(
              slivers: [
                // const HomeAppBar(),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Column(
                        children: [
                          SizedBox(height: 5.h),
                          Heading(title: "Breaking News", onButtonPress: () {}),
                          SizedBox(height: 10.h),
                          NewsSlider(
                              topHeadlines: topHeadlines,
                              carouselController: _carouselController),
                          NewsSliderIndicator(topHeadlines: topHeadlines),
                          SizedBox(height: 18.h),
                          Heading(
                              title: "Recommendation",
                              onButtonPress: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            ViewAllNewsScreen()));
                              }),
                        ],
                      )
                    ],
                  ),
                ),
                RecommendedNews(recommendedNewsList: techCrunch),
              ],
            );
          }
        },
      ),
    );
  }
}
