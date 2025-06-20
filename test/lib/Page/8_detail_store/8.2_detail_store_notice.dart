import 'package:flutter/material.dart';

class DetailStoreNotice extends StatelessWidget {
  final Map<String, dynamic> detailStoreInformation;

  const DetailStoreNotice({super.key, required this.detailStoreInformation});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.041, right: screenWidth * 0.041),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xffdbdbdb),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ExpansionTile(
          visualDensity: const VisualDensity(vertical: -4),
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          shape: const Border(
            top: BorderSide(color: Colors.transparent),
            bottom: BorderSide(color: Colors.transparent),
          ),
          collapsedShape: const Border(
            top: BorderSide(color: Colors.transparent),
            bottom: BorderSide(color: Colors.transparent),
          ),
          title: Row(
            children: [
              const Icon(
                Icons.campaign_outlined,
                color: Color(0xff8e8e8e),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: '[필독]',
                        style: TextStyle(
                          color: Color(0xfff64f4f),
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(width: 5),
                      ),
                      TextSpan(
                        text:
                            '${detailStoreInformation['marketName']} 공지사항입니다.',
                        style: const TextStyle(
                          color: Color(0xff393939),
                          fontFamily: 'PretendardSemiBold',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detailStoreInformation['announcement'] == null
                        ? '공지사항이 없습니다.'
                        : detailStoreInformation['announcement'].toString(),
                    style: const TextStyle(
                      color: Color(0xff5b5b5b),
                      fontFamily: 'PretendardSemiBold',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
