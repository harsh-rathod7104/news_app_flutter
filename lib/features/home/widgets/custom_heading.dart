import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/textstyle.dart';

class Heading extends StatelessWidget {
  final String title;
  final VoidCallback onButtonPress;

  const Heading({
    super.key,
    required this.title,
    required this.onButtonPress,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style:
                appStyle(color: Colors.black, fw: FontWeight.w500, size: 18.sp),
          ),
          CupertinoButton(
              onPressed: onButtonPress, child: const Text("View all"))
        ],
      ),
    );
  }
}
