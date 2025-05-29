import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class TechCardSection extends StatelessWidget {
  final Type constantsType;

  const TechCardSection({super.key, required this.constantsType});

  Map<String, dynamic> _getConstantsData() {
    switch (constantsType) {
      case const (PatternTextConstants):
        return {
          'items': PatternTextConstants.items,
          'title': PatternTextConstants.title,
          'subTitle': PatternTextConstants.subTitle,
          'highlight': PatternTextConstants.highlight,
          'highlightDescription': PatternTextConstants.highlightDescription,
          'starredIndexes': PatternTextConstants.starredIndexes,
        };
      case const (StateManagementConstants):
        return {
          'items': StateManagementConstants.items,
          'title': StateManagementConstants.title,
          'subTitle': StateManagementConstants.subTitle,
          'highlight': StateManagementConstants.highlight,
          'highlightDescription': StateManagementConstants.highlightDescription,
          'starredIndexes': StateManagementConstants.starredIndexes,
        };
      case const (LifecycleConstants):
        return {
          'items': LifecycleConstants.items,
          'title': LifecycleConstants.title,
          'subTitle': LifecycleConstants.subTitle,
          'highlight': LifecycleConstants.highlight,
          'highlightDescription': LifecycleConstants.highlightDescription,
          'starredIndexes': LifecycleConstants.starredIndexes,
        };
      case const (AnimationConstants):
        return {
          'items': AnimationConstants.items,
          'title': AnimationConstants.title,
          'subTitle': AnimationConstants.subTitle,
          'highlight': AnimationConstants.highlight,
          'highlightDescription': AnimationConstants.highlightDescription,
          'starredIndexes': AnimationConstants.starredIndexes,
        };

      default:
        return {
          'items': <Map<String, String>>[],
          'title': '',
          'click': '',
          'highlight': '',
          'highlightDescription': '',
          'starredIndexes': <int>[],
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = _getConstantsData();
    final List<Map<String, String>> items = data['items'];
    final String title = data['title'];
    final String subTitle = data['subTitle'];
    final String highlight = data['highlight'];
    final String highlightDescription = data['highlightDescription'];
    final List<int> starredIndexes = data['starredIndexes'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              if (starredIndexes.isNotEmpty) ...[
                SizedBox(width: 8.w),
                Icon(Icons.star, color: Colors.amber.shade400, size: 20),
              ],
              const Spacer(),
              Text(
                subTitle,
                style: TextStyle(fontSize: 12.sp, color: Colors.black54),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),

        SizedBox(
          height: 160.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              bool shouldShowCardStar = false;
              if (constantsType == LifecycleConstants && index == 0) {
                shouldShowCardStar = true;
              } else if (constantsType == AnimationConstants && index == 0) {
                shouldShowCardStar = true;
              }

              return Container(
                width: 280.w,
                margin: EdgeInsets.only(right: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                ),
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item['title']!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                              letterSpacing: 0.5,
                            ),
                          ),
                          if (shouldShowCardStar) ...[
                            SizedBox(width: 6.w),
                            Icon(
                              Icons.star,
                              color: Colors.amber.shade400,
                              size: 16,
                            ),
                          ],
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Expanded(
                      child: Center(
                        child: Text(
                          item['desc']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black54,
                            height: 1.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: highlight,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextSpan(
                  text: highlightDescription,
                  style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
