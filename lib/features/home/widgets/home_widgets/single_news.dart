import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/textstyle.dart';
import 'package:news_app/features/home/models/news_model.dart';

class SingleNews extends StatelessWidget {
  final NewsModel recommendedNews;
  const SingleNews({super.key, required this.recommendedNews});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.35,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.35,
              width: MediaQuery.of(context).size.width * 0.35,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: CachedNetworkImage(
                    imageUrl: recommendedNews.urlToImage.toString(),
                    errorWidget: (context, url, error) {
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    },
                    progressIndicatorBuilder: (context, url, progress) {
                      return const FadeShimmer(
                        width: double.infinity,
                        height: double.infinity,
                        highlightColor: Color.fromARGB(255, 195, 212, 239),
                        baseColor: Color(0xff20252d),
                      );
                    },
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(width: 8.w),
            SizedBox(
              // height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.55,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommendedNews.source!["name"].toString(),
                      style: appStyle(
                          color: Colors.black45,
                          fw: FontWeight.w500,
                          size: 12.sp),
                    ),
                    Text(
                      recommendedNews.title.toString(),
                      style: appStyle(
                          color: Colors.black,
                          fw: FontWeight.w600,
                          size: 10.sp),
                    ),
                    Wrap(
                      children: [
                        Text(
                          "Author: ${recommendedNews.author.toString()}",
                          style: appStyle(
                              color: Colors.black45,
                              fw: FontWeight.w500,
                              size: 10.sp),
                        ),
                        Text(
                          recommendedNews.publishedAt.toString(),
                          style: appStyle(
                              color: Colors.black45,
                              fw: FontWeight.w500,
                              size: 10.sp),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
