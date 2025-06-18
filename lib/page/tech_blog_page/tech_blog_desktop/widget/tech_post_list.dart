import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechPostList extends StatelessWidget {
  const TechPostList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: 600,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        itemCount: 6,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '학습 내용 제목 $index',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '#해시태그1  #해시태그2  #해시태그3',
                  style: GoogleFonts.montserrat(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
