import 'package:flutter/material.dart';
import 'package:my_dream/coreService/kakao_api_service.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/coreService/widget/searchbar.dart';
import '7.3.1_partnership_searchScreen.dart';
import '7.3.2_partnership_kakaoMap.dart';

class PartnershipSearch extends StatefulWidget {
  const PartnershipSearch({super.key});

  @override
  State<PartnershipSearch> createState() => _PartnershipSearchState();
}

class _PartnershipSearchState extends State<PartnershipSearch> {
  final KakaoApiService apiService = KakaoApiService();
  List<dynamic> _results = [];
  bool _isChangeScreen = false;
  bool backSearchPage = false;
  Map<String, dynamic>? _selectedPlace;

  void _search(String value) async {
    setState(() {
      _isChangeScreen = false;
      _results = [];
    });

    if (value.isNotEmpty) {
      final results = await apiService.searchBusinesses(value);
      setState(() {
        _results = results;
      });
    } else {
      setState(() {
        _results = [];
      });
    }
  }

  void _onPlaceSelected(Map<String, dynamic> place) {
    setState(() {
      _isChangeScreen = true;
      _selectedPlace = place;
    });
  }

  // 뒤로가기
  void kakaoMapPop() {
    setState(() {
      _isChangeScreen = false;
    });
  }

  void backSearch() {
    backSearchPage = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final String pageStatus =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
              child: Column(
                children: [
                  CustomAppBar(
                    title: '업체 검색',
                    kakaoMapPop: kakaoMapPop,
                    kakakoMapChange: _isChangeScreen,
                  ),
                  Searchbar(
                    textEditing: '업체명을 입력해주세요.',
                    onChanged: _search,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.012),
            Expanded(
              child: _isChangeScreen && _selectedPlace != null
                  ? PartnershipKakaoMap(
                      pageStatus: pageStatus,
                      latitude: double.parse(_selectedPlace!['y']),
                      longitude: double.parse(_selectedPlace!['x']),
                      placeName: _selectedPlace!['place_name'],
                      address: _selectedPlace!['road_address_name'] ??
                          _selectedPlace!['address_name'],
                      phone: _selectedPlace!['phone'],
                    )
                  : PartnershipSearchScreen(
                      results: _results,
                      onPlaceSelected: _onPlaceSelected,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
