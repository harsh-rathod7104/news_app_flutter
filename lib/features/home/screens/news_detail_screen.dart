import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/textstyle.dart';
import 'package:news_app/features/home/models/news_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel news;
  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
              pinned: true,
              stretch: true,
              expandedHeight: 230.h,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.blurBackground,
                  StretchMode.zoomBackground,
                ],
                background: Image.network(
                  news.urlToImage!,
                  fit: BoxFit.cover,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0.0),
                child: Container(
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r)),
                  ),
                ),
              ),
              leadingWidth: 80.w,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(news.source!["name"].toString(),
                        style: titleStyle(
                            color: Colors.black,
                            fw: FontWeight.w700,
                            size: 18.sp)),
                    SizedBox(height: 20.h),
                    Text(news.title.toString(),
                        style: appStyle(
                            color: Colors.black,
                            fw: FontWeight.w800,
                            size: 16.sp)),
                    SizedBox(height: 2.h),
                    Text(
                      news.description.toString(),
                      style: appStyle(
                        color: Colors.black,
                        fw: FontWeight.w600,
                        size: 14.sp,
                      ),
                    ),
                    const Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(height: 10.h),
                    Text(news.content.toString()),
                    Text(news.author.toString()),
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
