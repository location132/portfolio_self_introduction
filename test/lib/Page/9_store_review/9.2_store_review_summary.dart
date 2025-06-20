import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class StoreReviewSummary extends StatefulWidget {
  final Map<String, dynamic> reviewstatistics;

  const StoreReviewSummary({super.key, required this.reviewstatistics});

  @override
  State<StoreReviewSummary> createState() => _StoreReviewSummaryState();
}

class _StoreReviewSummaryState extends State<StoreReviewSummary>
    with SingleTickerProviderStateMixin {
  late List<int> personnelList;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    personnelList = List.generate(5, (index) {
      return widget.reviewstatistics['statistics'].firstWhere(
          (item) => item['score'] == 5 - index,
          orElse: () => {'count': 0})['count'] as int;
    });

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double calculateNormalizedValue(int value, int min, int max) {
    return max > min ? (value - min) / (max - min) : 0.0;
  }

  Widget scoreText(String score, int personnel) {
    int min = personnelList.reduce((a, b) => a < b ? a : b);
    int max = personnelList.reduce((a, b) => a > b ? a : b);

    double normalizedValue = calculateNormalizedValue(personnel, min, max);
    bool isHighest = personnel == max;

    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: [
          Text(
            personnel.toString(),
            style: TextStyle(
              color:
                  isHighest ? const Color(0xff6fbf8a) : const Color(0xffc1c1c1),
              fontSize: 12,
              fontFamily: 'Pretendard',
            ),
          ),
          const SizedBox(height: 7),
          SizedBox(
            height: 92,
            width: 10,
            child: RotatedBox(
              quarterTurns: 3,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff5f5f5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return FractionallySizedBox(
                        widthFactor: normalizedValue * _animation.value,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff6fbf8a),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '$score점',
            style: const TextStyle(
              color: Color(0xff8e8e8e),
              fontSize: 12,
              fontFamily: 'Pretendard',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: screenWidth * 0.46,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xfff5f5f5),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Column(
            children: [
              const Spacer(),
              const Text(
                '총 평점',
                style: TextStyle(
                  color: Color(0xff5b5b5b),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                ),
              ),
              Text(
                widget.reviewstatistics['averageScore']
                    .toStringAsFixed(1)
                    .toString(),
                style: const TextStyle(
                  color: Color(0xff282828),
                  fontSize: 36,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
              ),
              RatingBar.readOnly(
                isHalfAllowed: true,
                size: 30,
                alignment: Alignment.center,
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                emptyColor: const Color(0xfff7ce45),
                halfFilledColor: const Color(0xfff7ce45),
                halfFilledIcon: Icons.star_half,
                initialRating:
                    (widget.reviewstatistics['averageScore'] * 2).floor() / 2,
                maxRating: 5,
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  scoreText('5', personnelList[0]),
                  scoreText('4', personnelList[1]),
                  scoreText('3', personnelList[2]),
                  scoreText('2', personnelList[3]),
                  scoreText('1', personnelList[4]),
                ],
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
