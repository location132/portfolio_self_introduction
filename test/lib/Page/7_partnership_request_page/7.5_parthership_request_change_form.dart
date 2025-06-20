// 요청글 수정 페이지//

import 'package:flutter/material.dart';
import 'package:my_dream/Page/7_partnership_request_page/0.partnership_dio/partnership_screen_dio.dart';
import 'package:my_dream/Page/7_partnership_request_page/2.partnership_formpage/7.2.1_partnership_request_form_textfield.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class PartnershipRequestChangeForm extends StatefulWidget {
  final Map<String, dynamic> serverDetailData;
  const PartnershipRequestChangeForm(
      {super.key, required this.serverDetailData});

  @override
  State<PartnershipRequestChangeForm> createState() =>
      _PartnershipRequestChangeFormState();
}

class _PartnershipRequestChangeFormState
    extends State<PartnershipRequestChangeForm> {
  late PartnershipRequestChangeModel _partnershipRequestChangeModel;
  late final TextEditingController _textEditingController;
  late final TextEditingController _titleController;
  late final TextEditingController _detailAddressController;
  Map<String, dynamic> serverDetailData = {};
  KakaoMapController? mapController;
  Set<Marker> markers = {}; // 마커 변수
  bool _mounted = true;
  bool _marketDataStatus = true;
  bool _marketDescriptionStatus = true;
  int _loadFirstTime = 0; // 프로바이더 제어하려고 선언한 변수

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _partnershipRequestChangeModel =
        Provider.of<PartnershipRequestChangeModel>(context);
    _partnershipRequestChangeModel.addListener(_updateState);
    _updateMap();
  }

  @override
  void dispose() {
    _partnershipRequestChangeModel.removeListener(_updateState);
    _mounted = false;
    super.dispose();
  }

  void _initializeControllers() {
    _titleController =
        TextEditingController(text: widget.serverDetailData['title']);
    _textEditingController =
        TextEditingController(text: widget.serverDetailData['description']);
    _detailAddressController = TextEditingController(
        text: widget.serverDetailData['marketDetailAddress']);
  }

  void _updateState() {
    if (_mounted) {
      setState(() {});
    }
  }

  void _updateMap() async {
    if (_mounted &&
        _partnershipRequestChangeModel.selectedLatitude != null &&
        _partnershipRequestChangeModel.selectedLongitude != null) {
      setState(() {
        markers.clear();
        markers.add(Marker(
          markerId: UniqueKey().toString(),
          latLng: LatLng(
            _partnershipRequestChangeModel.selectedLatitude!,
            _partnershipRequestChangeModel.selectedLongitude!,
          ),
        ));
      });

      if (mapController != null) {
        await mapController!.setCenter(LatLng(
          _partnershipRequestChangeModel.selectedLatitude!,
          _partnershipRequestChangeModel.selectedLongitude!,
        ));
      }
    } else {
      if (_loadFirstTime == 1) {
        return;
      } else {
        _initializepartnershipRequestChangeModel();
        _loadFirstTime += 1;
      }
    }
  }

  void _initializepartnershipRequestChangeModel() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _partnershipRequestChangeModel.setSelectedBusiness(
        widget.serverDetailData['marketName'],
        widget.serverDetailData['marketAddress'],
        widget.serverDetailData['marketDetailAddress'],
        widget.serverDetailData['marketPhone'],
        widget.serverDetailData['locationY'],
        widget.serverDetailData['locationX']);
  }

  bool _isFormComplete() {
    return _detailAddressController.text.isNotEmpty &&
        _partnershipRequestChangeModel.selectedBusinessAddress != null &&
        _partnershipRequestChangeModel.selectedBusinessName != null &&
        _partnershipRequestChangeModel.selectedBusinessPhone != null &&
        _partnershipRequestChangeModel.selectedLatitude != null &&
        _partnershipRequestChangeModel.selectedLongitude != null &&
        _titleController.text.isNotEmpty;
  }

  bool activeSubmitButton() {
    // 등록하기 버튼 활성화하기
    if (_isFormComplete() && _textEditingController.text.isNotEmpty) {
      setState(() {});
      return true;
    } else {
      setState(() {});
      return false;
    }
  }

  bool checkAvailableData() {
    if (_isFormComplete()) {
      if (_textEditingController.text.isNotEmpty) {
        setState(() {
          _marketDataStatus = true;
          _marketDescriptionStatus = true;
        });
        return true;
      } else {
        setState(() {
          _marketDataStatus = true;
          _marketDescriptionStatus = false;
        });
        return false;
      }
    } else {
      setState(() {
        _marketDataStatus = false;
        _marketDescriptionStatus = _textEditingController.text.isNotEmpty;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final secondScreenHeight = screenHeight * 0.722;
    final secondScreenWidth = screenWidth - screenWidth * 0.041 * 2;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.041, right: screenWidth * 0.041),
            child: Column(
              children: [
                const CustomAppBar(
                  title: '파트너쉽 요청 글쓰기',
                  type: 'requestChange',
                ),
                SizedBox(height: secondScreenHeight * 0.017),
                SizedBox(
                  height: _marketDataStatus && _marketDescriptionStatus
                      ? screenHeight * 0.722
                      : screenHeight * 0.725,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0c000000),
                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color(0x0c000000),
                          offset: Offset(-2, 0),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: secondScreenHeight * 0.028,
                              left: secondScreenWidth * 0.042),
                          child: Row(
                            children: [
                              const Text(
                                '제목 : ',
                                style: TextStyle(
                                  color: Color(0xff8e8e8e),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: SizedBox(
                                  height: 21,
                                  child: TextFormField(
                                    controller: _titleController,
                                    decoration: const InputDecoration(
                                      hintText: '제목을 입력해주세요.',
                                      hintStyle: TextStyle(
                                        color: Color(0xffc1c1c1),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      color: Color(0xff8e8e8e),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                    ),
                                    onChanged: (text) {
                                      activeSubmitButton();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: secondScreenHeight * 0.02),
                        Consumer<PartnershipRequestChangeModel>(
                          builder: (context, model, child) {
                            if (model.selectedLatitude == null ||
                                model.selectedLongitude == null) {
                              return Center(
                                child: Container(
                                  height: secondScreenHeight * 0.246,
                                  width: double.infinity,
                                  color: const Color(0xffc1c1c1),
                                  child: const SizedBox(),
                                ),
                              );
                            }

                            return Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: SizedBox(
                                height: secondScreenHeight * 0.246,
                                child: KakaoMap(
                                  currentLevel: 1,
                                  center: LatLng(
                                    model.selectedLatitude!,
                                    model.selectedLongitude!,
                                  ),
                                  onMapCreated: (controller) {
                                    mapController = controller;

                                    _updateMap(); // 여기에 _updateMap 호출 추가
                                  },
                                  markers: markers.toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height: _marketDataStatus
                                    ? secondScreenHeight * 0.025
                                    : secondScreenHeight * 0.018),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: secondScreenWidth * 0.042,
                                  right: secondScreenWidth * 0.042),
                              child: Column(
                                children: [
                                  NewWidget(
                                    title: '업체명',
                                    initialValue: _partnershipRequestChangeModel
                                            .selectedBusinessName ??
                                        '${widget.serverDetailData['marketName']}',
                                    dataStatus: _marketDataStatus,
                                  ),
                                  SizedBox(height: secondScreenHeight * 0.011),
                                  NewWidget(
                                    title: '업체위치',
                                    initialValue: _partnershipRequestChangeModel
                                            .selectedBusinessAddress ??
                                        '${widget.serverDetailData['marketAddress']}',
                                    dataStatus: _marketDataStatus,
                                  ),
                                  SizedBox(height: secondScreenHeight * 0.011),
                                  Row(
                                    // 상세정보
                                    children: [
                                      const Text(
                                        '상세주소 :',
                                        style: TextStyle(
                                          color: Color(0xff8e8e8e),
                                          fontFamily: 'Pretendard',
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: screenWidth * 0.675,
                                        height: 30,
                                        child: TextFormField(
                                          controller: _detailAddressController,
                                          decoration: InputDecoration(
                                            fillColor: Colors.transparent,
                                            filled: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 10),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                color: _marketDataStatus
                                                    ? const Color(0xffdbdbdb)
                                                    : Colors.red,
                                                width: 0.9,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              borderSide: const BorderSide(
                                                color: Color(0xffdbdbdb),
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                          ),
                                          onChanged: (text) {
                                            activeSubmitButton();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: secondScreenHeight * 0.011),
                                  NewWidget(
                                    title: '전화번호',
                                    initialValue: _partnershipRequestChangeModel
                                            .selectedBusinessPhone ??
                                        '${widget.serverDetailData['marketPhone']}',
                                    dataStatus: _marketDataStatus,
                                  ),
                                  !_marketDataStatus
                                      ? const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 3, bottom: 3),
                                              child: Text(
                                                '* 업체정보를 필수로 입력해 주세요',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                  _marketDataStatus
                                      ? SizedBox(
                                          height: secondScreenHeight * 0.033)
                                      : const SizedBox(),
                                  Container(
                                    height: secondScreenHeight * 0.262,
                                    decoration: BoxDecoration(
                                      color: const Color(0xfff5f5f5),
                                      border: Border.all(
                                        color: _marketDescriptionStatus
                                            ? const Color(0xffdbdbdb)
                                            : Colors.red,
                                        width: 0.9,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, bottom: 20),
                                          child: TextFormField(
                                            controller: _textEditingController,
                                            maxLines: null,
                                            maxLength: 1000,
                                            style:
                                                const TextStyle(fontSize: 14),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  '내용글을 작성해주세요. (500자 내외)',
                                              hintStyle: TextStyle(
                                                color: Color(0xff8e8e8e),
                                                fontFamily: 'Pretendard',
                                              ),
                                              counterText: '',
                                            ),
                                            onChanged: (text) {
                                              activeSubmitButton();
                                            },
                                          ),
                                        ),
                                        Positioned(
                                          right: 10,
                                          bottom: 5,
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '${_textEditingController.text.length}',
                                                  style: const TextStyle(
                                                    color: Color(0xff5b5b5b),
                                                    fontSize: 14,
                                                    fontFamily: 'Pretendard',
                                                  ),
                                                ),
                                                const TextSpan(
                                                  text: ' / 1,000',
                                                  style: TextStyle(
                                                    color: Color(0xff8e8e8e),
                                                    fontSize: 14,
                                                    fontFamily: 'Pretendard',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  !_marketDescriptionStatus
                                      ? const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4, bottom: 4),
                                              child: Text(
                                                '* 내용글을 필수로 입력해주세요',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                  !_marketDescriptionStatus
                                      ? const SizedBox()
                                      : SizedBox(
                                          height: secondScreenHeight * 0.025),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Navigator.pushNamed(
                                          context, '/PartnershipSearch',
                                          arguments: 'ChangePage');
                                      setState(() {}); // 네비게이션 후 상태 업데이트
                                    },
                                    child: Container(
                                      height: secondScreenHeight * 0.074,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: const Color(0xff6fbf8a),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '업체정보 한번에 불러오기',
                                          style: TextStyle(
                                            color: Color(0xff6fbf8a),
                                            fontSize: 15.5,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height: _marketDescriptionStatus
                        ? secondScreenHeight * 0.033
                        : secondScreenHeight * 0.03),
                submitButton(), // 수정하기 버튼
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget submitButton() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: activeSubmitButton()
            ? const Color(0xff6fbf8a)
            : const Color(0xff8e8e8e),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (checkAvailableData()) {
              partnershipRequestChange(
                widget.serverDetailData['partnerRequestId'],
                _titleController.text,
                _partnershipRequestChangeModel.selectedBusinessName!,
                _partnershipRequestChangeModel.selectedBusinessAddress!,
                _detailAddressController.text,
                _textEditingController.text,
                _partnershipRequestChangeModel.selectedBusinessPhone!,
                _partnershipRequestChangeModel.selectedLatitude!,
                _partnershipRequestChangeModel.selectedLongitude!,
              );

              _partnershipRequestChangeModel.clearSelectedBusiness();
              Navigator.popUntil(context, (route) {
                return route.settings.name == '/PartnershipRequestScreen' ||
                    route.isFirst;
              }); //파트너쉽 요청 페이지로 돌아가기
              Navigator.pushReplacementNamed(
                  context, '/PartnershipRequestScreen'); // 리로딩 작업
            }
          },
          child: const Text(
            '수정하기',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
