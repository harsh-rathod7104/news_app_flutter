import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          margin: EdgeInsets.only(left: 8.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade100,
          ),
          child: const Icon(Icons.menu),
        ),
        SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                margin: EdgeInsets.only(left: 8.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade100,
                ),
                child: const Icon(Icons.search),
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                margin: EdgeInsets.only(left: 8.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade100,
                ),
                child: const Icon(Icons.notifications_none_sharp),
              ),
            ],
          ),
        )
      ],
    );
  }
}
