import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileTechPostTitle extends StatelessWidget {
  final String title;
  final String tags;
  final int number;
  final VoidCallback? onTap;
  final String? uploadDate;
  final bool isUpload;

  const MobileTechPostTitle({
    super.key,
    required this.title,
    required this.tags,
    required this.number,
    this.onTap,
    this.uploadDate,
    this.isUpload = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${number.toString().padLeft(2, '0')}.',
                style: GoogleFonts.montserrat(
                  color: Colors.grey.shade600,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: GoogleFonts.montserrat(
                              color:
                                  isUpload
                                      ? Colors.white
                                      : Colors.grey.shade600,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (uploadDate != null && !isUpload) ...[
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              '$uploadDate 업로드 예정',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      tags,
                      style: GoogleFonts.montserrat(
                        color:
                            isUpload
                                ? Colors.grey.shade400
                                : Colors.grey.shade600,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
