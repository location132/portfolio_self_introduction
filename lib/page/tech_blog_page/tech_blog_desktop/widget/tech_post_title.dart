import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechPostTitle extends StatelessWidget {
  final String title;
  final String tags;
  final int number;

  const TechPostTitle({
    super.key,
    required this.title,
    required this.tags,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${number.toString().padLeft(2, '0')}.',
            style: GoogleFonts.montserrat(
              color: Colors.grey.shade600,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  tags,
                  style: GoogleFonts.montserrat(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
