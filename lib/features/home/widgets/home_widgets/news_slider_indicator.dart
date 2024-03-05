import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/bloc/carousel_bloc/carousel_bloc.dart';
import 'package:news_app/features/home/models/news_model.dart';

class NewsSliderIndicator extends StatelessWidget {
  const NewsSliderIndicator({
    super.key,
    required this.topHeadlines,
  });

  final List<NewsModel> topHeadlines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 10.h,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: topHeadlines.length,
          itemBuilder: (context, index) {
            return BlocBuilder<CarouselCubit, int>(
              builder: (context, state) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  margin: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: state == index ? Colors.blue : Colors.grey.shade200,
                    // shape: BoxShape.circle,
                  ),
                  // height: 4.w,
                  width: state == index ? 25.w : 8.h,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
