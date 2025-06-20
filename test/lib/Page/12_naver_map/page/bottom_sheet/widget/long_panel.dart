import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_cubit.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_state.dart';
import 'package:my_dream/coreService/widget/%08ifsai_button_components/wide_green_button.dart';

class LongPanel extends StatefulWidget {
  const LongPanel({super.key});

  @override
  State<LongPanel> createState() => _LongPanelState();
}

class _LongPanelState extends State<LongPanel> {
  final ScrollController _controller = ScrollController();
  double turns = 0.0;
  bool isBottomButtonEnabled = false;
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // 이전 타이머가 있다면 취소
    _scrollTimer?.cancel();

    // 스크롤 중에는 버튼 비활성화
    setState(() {
      isBottomButtonEnabled = false;
    });

    // 스크롤이 멈추고 500ms 후에 버튼 활성화
    _scrollTimer = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          isBottomButtonEnabled = true;
        });
      }
    });
  }

  void _handleDistanceUpdate(NaverMapState state) {
    setState(() {
      turns += 1;
    });
    context.read<NaverMapCubit>().updateDistance(context);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NaverMapCubit, NaverMapState>(
      builder: (context, state) {
        return Stack(
          children: [
            // 스크롤 가능한 콘텐츠
            Padding(
              padding: EdgeInsets.only(top: 30.sh),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 190.sh,
                      color: Colors.grey,
                      child: const Center(
                        child: Text('사진이 들어갈 장소입니다.'),
                      ),
                    ),
                    SizedBox(height: 12.sh),
                    // 매장 정보
                    Padding(
                      padding: EdgeInsets.only(left: 16.sw),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            state.selectedMarkerData?.marketName ?? '',
                            style: const TextStyle(
                              color: Color(0xff393939),
                              fontSize: 24,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10.sw),
                          Text(
                            state.selectedMarkerData?.marketDescription ?? '',
                            style: const TextStyle(
                              color: Color(0xffc1c1c1),
                              fontSize: 15,
                              fontFamily: 'Pretendard',
                            ),
                          ),
                          SizedBox(width: 10.sw),
                          InkWell(
                            onTap: () => _handleDistanceUpdate(state),
                            child: Text(
                              state.distance,
                              style: const TextStyle(
                                color: Color(0xff6fbf8a),
                                fontSize: 15,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                          ),
                          SizedBox(width: 5.sw),
                          if (state.locationPermissionState !=
                              LocationPermissionState.granted) ...[
                            InkWell(
                              onTap: () => _handleDistanceUpdate(state),
                              child: AnimatedRotation(
                                duration: const Duration(milliseconds: 420),
                                turns: turns,
                                child: Icon(
                                  Icons.refresh,
                                  color: Colors.grey,
                                  size: 15.sh,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    // 별점과 리뷰 정보
                    //TODO: 데이터 연동 후 삭제   StoreRatingSummary 이 코드 연결
                    Padding(
                      padding: EdgeInsets.only(left: 16.sw, top: 5.sh),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 30,
                            color: Color(0xfff7ce45),
                          ),
                          const Text(
                            '4.5',
                            style: TextStyle(
                              color: Color(0xff282828),
                              fontSize: 24,
                              fontFamily: 'PretendardSemiBold',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Row(
                              children: [
                                Text(
                                  '리뷰 1,321',
                                  style: TextStyle(
                                    color: Color(0xff8e8e8e),
                                    fontSize: 18,
                                    fontFamily: 'Pretendard',
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 13,
                                  color: Color(0xff8e8e8e),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.sh),
                    const Divider(
                      color: Color(0xfff5f5f5),
                      thickness: 1,
                    ),
                    //TODO: 데이터 연동 후 삭제  StoreInfoSummary
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sw),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 120.sw,
                                    child: const Text(
                                      '최소 주문금액',
                                      style: TextStyle(
                                        color: Color(0xff8e8e8e),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Text(
                                      '16,000 원',
                                      style: TextStyle(
                                        color: Color(0xff393939),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 120.sw,
                                    child: const Text(
                                      '영업시간',
                                      style: TextStyle(
                                        color: Color(0xff8e8e8e),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Text(
                                      '오후 18:00 ~ 오전 01:00 \n매주 월, 수 휴무',
                                      style: TextStyle(
                                        color: Color(0xff393939),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 120.sw,
                                    child: const Text(
                                      '조리시간',
                                      style: TextStyle(
                                        color: Color(0xff8e8e8e),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Text(
                                      '평균 40~50분 정도 소요',
                                      style: TextStyle(
                                        color: Color(0xff393939),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 120.sw,
                                    child: const Text(
                                      '매장위치',
                                      style: TextStyle(
                                        color: Color(0xff8e8e8e),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Text(
                                      '서울특별시 강남구 테헤란로 14길 5 101호',
                                      style: TextStyle(
                                        color: Color(0xff393939),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                      ),
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 120.sw,
                                    child: const Text(
                                      '전화번호',
                                      style: TextStyle(
                                        color: Color(0xff8e8e8e),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    '02-543-1234',
                                    style: TextStyle(
                                      color: Color(0xff393939),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    height: 20,
                                    width: 62,
                                    decoration: BoxDecoration(
                                      color: const Color(0xfff5f5f5),
                                      border: Border.all(
                                        color: const Color(0xffdbdbdb),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: const Center(
                                        child: Text(
                                          '전화걸기',
                                          style: TextStyle(
                                            color: Color(0xff5b5b5b),
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.5.sh),
                    const Divider(
                      color: Color(0xfff5f5f5),
                      thickness: 1,
                    ),
                    // TODO: 테스트 이미지 추가 데이터 연결 후 삭제
                    SizedBox(height: 19.sh),
                    Image.asset(
                      'assets/images/test1.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/test2.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/test3.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/test4.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/test5.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            // 드래그 핸들
            Positioned(
              top: 1.5.sh,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 8.sh),
                child: Center(
                  child: Container(
                    width: 30.sw,
                    height: 3.sh,
                    decoration: const BoxDecoration(
                      color: Color(0xffd9d9d9),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              ),
            ),
            // 매장 상세페이지 이동 버튼
            Positioned(
              bottom: 0.sh,
              left: 0.sw,
              right: 0.sw,
              child: AnimatedOpacity(
                opacity: isBottomButtonEnabled ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 420),
                child: IgnorePointer(
                  ignoring: !isBottomButtonEnabled,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.sw,
                        right: 16.sw,
                        bottom: MediaQuery.of(context).padding.bottom,
                        top: 10.sh,
                      ),
                      child: WideGreenButton(
                        buttonText: '매장 상세페이지 이동',
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
