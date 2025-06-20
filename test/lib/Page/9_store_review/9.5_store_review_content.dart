import 'package:flutter/material.dart';
import 'package:my_dream/Page/9_store_review/9.6.1_store_review_content_detail.dart';
import 'package:my_dream/Page/9_store_review/9.6_store_review_best_content_detail.dart';

class StoreReviewContent extends StatefulWidget {
  final Map<String, dynamic> reviews;
  final Map<String, dynamic> bestReviews;

  const StoreReviewContent(
      {super.key, required this.reviews, required this.bestReviews});

  @override
  State<StoreReviewContent> createState() => _StoreReviewContent();
}

class _StoreReviewContent extends State<StoreReviewContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.bestReviews['reviews'].length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                StoreBestReviewContentDetail(
                    reviews: widget.bestReviews, index: index),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.reviews['reviews'].length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                StoreReviewContentDetail(reviews: widget.reviews, index: index),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ],
    );
  }
}
