import 'package:flutter/material.dart';

import 'package:my_dream/Page/4_main_page/4.9.1_main_tourist_container.dart';
import 'package:my_dream/Page/4_main_page/components/main_title_overview.dart';
import 'package:my_dream/Page/4_main_page/main_dio/main_screen_dio.dart';

class MainTouristAttractions extends StatefulWidget {
  final VoidCallback onLoadingComplete;

  const MainTouristAttractions({super.key, required this.onLoadingComplete});

  @override
  State<MainTouristAttractions> createState() => _MainTouristAttractionsState();
}

class _MainTouristAttractionsState extends State<MainTouristAttractions> {
  List<Map<String, dynamic>> serverResult = [];

  bool _isFinish = false;

  @override
  void initState() {
    super.initState();
    attractionsGetDio();
  }

  void attractionsGetDio() async {
    serverResult = await mainScreenTourism(4);
    widget.onLoadingComplete();

    _isFinish = true;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _isFinish
        ? Column(
            children: [
              MainTitleOverview(
                title: '건대생을 위한 추천 관광명소',
                onTap: () {
                  Navigator.pushNamed(context, '/DetailCategoryAttraction');
                },
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.041),
                child: Row(
                  children: [
                    BuildAttractionCard(
                      serverResultData: serverResult[0],
                    ),
                    const SizedBox(width: 14), // 간격 추가
                    BuildAttractionCard(
                      serverResultData: serverResult[1],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.041),
                child: Row(
                  children: [
                    BuildAttractionCard(
                      serverResultData: serverResult[2],
                    ),
                    const SizedBox(width: 14), // 간격 추가
                    BuildAttractionCard(
                      serverResultData: serverResult[3],
                    ),
                  ],
                ),
              ),
            ],
          )
        : const SizedBox();
  }
}
