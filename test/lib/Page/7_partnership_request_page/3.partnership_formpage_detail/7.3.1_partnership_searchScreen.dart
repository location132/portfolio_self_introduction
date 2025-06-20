import 'package:flutter/material.dart';

class PartnershipSearchScreen extends StatelessWidget {
  final List<dynamic> results;
  final Function(Map<String, dynamic>) onPlaceSelected;

  const PartnershipSearchScreen({
    super.key,
    required this.results,
    required this.onPlaceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: results.isNotEmpty ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 1),
          child: const Center(
            child: Column(
              children: [
                SizedBox(height: 70),
                Text(
                  '원하시는 업체를 찾아보세요.\n예) 잎사이 건대점',
                  style: TextStyle(
                    color: Color(0xffc1c1c1),
                    fontFamily: 'Pretendard',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: results.isEmpty ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 120),
          child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final item = results[index];
              return Column(
                children: [
                  ListTile(
                    title: Text(item['place_name']),
                    subtitle:
                        Text(item['road_address_name'] ?? item['address_name']),
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      onPlaceSelected(item);
                    },
                  ),
                  const Divider(height: 1, color: Color(0xfff5f5f5)),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
