import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechPostTitle extends StatelessWidget {
  final bool isUpload;
  final String title;
  final String tags;
  final int number;
  final VoidCallback? onTap;
  final Function(String)? onHover;
  final VoidCallback? onHoverExit;
  final String? uploadDate;
  final bool isCompleted;

  const TechPostTitle({
    super.key,
    this.isUpload = false,
    required this.title,
    required this.tags,
    required this.number,
    this.onTap,
    this.onHover,
    this.onHoverExit,
    this.uploadDate,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover?.call(title),
      onExit: (_) => onHoverExit?.call(),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
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
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: GoogleFonts.montserrat(
                                color:
                                    isUpload
                                        ? Colors.white
                                        : Colors.grey.shade600,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (uploadDate != null && !isCompleted) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade600.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.grey.shade600,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                '$uploadDate 업로드 예정',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        tags,
                        style: GoogleFonts.montserrat(
                          color:
                              isUpload
                                  ? Colors.grey.shade400
                                  : Colors.grey.shade600,
                          fontSize: 14,
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
      ),
    );
  }
}
