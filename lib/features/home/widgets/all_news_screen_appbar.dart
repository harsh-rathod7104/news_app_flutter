import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllNewsAppBar extends StatelessWidget {
  const AllNewsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15.w),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                color: Colors.grey.shade200, shape: BoxShape.circle),
            child: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        SizedBox(width: 20.w),
        const Text(
          "All News",
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
