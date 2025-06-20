import 'package:flutter/material.dart';

class StoreReviewNavigator extends StatefulWidget {
  final Map<String, dynamic> reviews;
  const StoreReviewNavigator({super.key, required this.reviews});

  @override
  State<StoreReviewNavigator> createState() => _StoreReviewNavigator();
}

class _StoreReviewNavigator extends State<StoreReviewNavigator> {
  List<String> listItem = ["최신순", " 인기순", "평점 높은 순", "평점 낮은 순"];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '리뷰(${widget.reviews['reviews'].length})',
          style: const TextStyle(
            color: Color(0xff393939),
            fontSize: 16,
            fontFamily: 'Pretendard',
          ),
        ),
        Container(
          height: screenHeight * 0.03,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xffdbdbdb),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          child: DropdownButton<String>(
            underline: Container(),
            value: selectedValue,
            hint: const Padding(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: Text(
                '최신순',
                style: TextStyle(
                  color: Color(0xff8e8e8e),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                ),
              ),
            ),
            icon: const Padding(
              padding: EdgeInsets.only(right: 3),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xff8e8e8e),
                size: 20,
              ),
            ),
            style: const TextStyle(
              color: Color(0xff8e8e8e),
              fontSize: 13,
              fontFamily: 'Pretendard',
            ),
            items: listItem.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return listItem.map<Widget>((String item) {
                return Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: Text(item),
                );
              }).toList();
            },
          ),
        ),
      ],
    );
  }
}
