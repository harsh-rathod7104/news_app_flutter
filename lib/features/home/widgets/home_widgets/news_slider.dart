import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/textstyle.dart';
import 'package:news_app/features/home/bloc/carousel_bloc/carousel_bloc.dart';
import 'package:news_app/features/home/models/news_model.dart';
import 'package:news_app/features/home/screens/news_detail_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NewsSlider extends StatelessWidget {
  const NewsSlider({
    super.key,
    required this.topHeadlines,
    required CarouselController carouselController,
  }) : _carouselController = carouselController;

  final List<NewsModel> topHeadlines;
  final CarouselController _carouselController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: topHeadlines.isNotEmpty
            ? CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: topHeadlines.length,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  final news = topHeadlines[itemIndex];
                  return GestureDetector(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                        withNavBar: false,
                        screen: NewsDetailScreen(
                          news: news,
                        ),
                      );
                    },
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 15.h, horizontal: 0),
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r)),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: double.infinity,
                            child: CachedNetworkImage(
                              color: Colors.black26,
                              colorBlendMode: BlendMode.darken,
                              fit: BoxFit.cover,
                              imageUrl: news.urlToImage!,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      FadeShimmer(
                                width: double.infinity,
                                height: 140.h,
                                highlightColor:
                                    const Color.fromARGB(255, 195, 212, 239),
                                baseColor: const Color(0xff20252d),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Center(child: const Icon(Icons.error)),
                            ),
                          ),
                          Positioned(
                            top: 18.h,
                            left: 20.w,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.blue,
                              ),
                              child: Text(
                                news.source!['name'],
                                style: appStyle(
                                  color: Colors.white,
                                  fw: FontWeight.w500,
                                  size: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 90.h,
                              left: 20.w,
                              child: Wrap(
                                children: [
                                  Text(news.author.toString(),
                                      style: appStyle(
                                          color: Colors.white,
                                          fw: FontWeight.w700,
                                          size: 12.sp)),
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    news.publishedAt.toString(),
                                    style: appStyle(
                                        color: Colors.white,
                                        fw: FontWeight.w700,
                                        size: 11.sp),
                                  ),
                                ],
                              )),
                          Positioned(
                            top: 110.h,
                            left: 20.w,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                news.title.toString(),
                                style: appStyle(
                                    color: Colors.white,
                                    fw: FontWeight.w500,
                                    size: 14.sp),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 190.h,
                  onPageChanged: (index, reason) {
                    BlocProvider.of<CarouselCubit>(context).setIndicator(index);
                  },
                  autoPlay: true,
                  viewportFraction: 0.85,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.22,
                  pageSnapping: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                ),
              )
            : const SizedBox.shrink());
  }
}
