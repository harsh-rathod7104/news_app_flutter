import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/textstyle.dart';
import 'package:news_app/features/home/bloc/carousel_bloc/carousel_bloc.dart';
import 'package:news_app/features/home/models/news_model.dart';

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
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 0),
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
                            imageUrl: topHeadlines[itemIndex].urlToImage!,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => FadeShimmer(
                              width: double.infinity,
                              height: 140.h,
                              highlightColor:
                                  const Color.fromARGB(255, 195, 212, 239),
                              baseColor: const Color(0xff20252d),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
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
                              topHeadlines[itemIndex].source!['name'],
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
                                Text(topHeadlines[itemIndex].author.toString(),
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
                                  topHeadlines[itemIndex]
                                      .publishedAt
                                      .toString(),
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
                              topHeadlines[itemIndex].title.toString(),
                              style: appStyle(
                                  color: Colors.white,
                                  fw: FontWeight.w500,
                                  size: 14.sp),
                            ),
                          ),
                        )
                      ],
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
