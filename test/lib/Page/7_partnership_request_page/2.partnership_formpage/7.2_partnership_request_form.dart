// +버튼을 눌렀을 때 나오는 요청글 페이지 //

/*
1. activeSubmitButton() => 등록하기 버튼을 활성화하기 위해서 정의한 함수
2. partnershipRequestSaveData() => 작성하던 내용이 있으면 다이아로그를 띄우도록 해주는 함수
3. checkAvailableData() => 아무 내용도 입력하지 않고 등록하기 버튼을 눌렀을 때 빨간색 테두리와 경고문이 나오도록 하는 함수
4. 등록하기 버튼을 누르면 서버로 데이터 전송 후 pop() 실행
*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_dream/Page/7_partnership_request_page/2.partnership_formpage/7.2.1_partnership_request_form_textfield.dart';
import 'package:my_dream/Page/7_partnership_request_page/0.partnership_dio/partnership_screen_dio.dart';
import 'package:my_dream/Page/7_partnership_request_page/2.partnership_formpage/7.2.2_partnership_request_form_button.dart';
import 'package:my_dream/coreService/Dialog/partnership_request_save_dialog.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class PartnershipRequestForm extends StatefulWidget {
  const PartnershipRequestForm({super.key});

  @override
  State<PartnershipRequestForm> createState() => _PartnershipRequestFormState();
}

class _PartnershipRequestFormState extends State<PartnershipRequestForm> {
  late PartnershipRequestModel _partnershipRequestModel;
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailAddressController =
      TextEditingController();
  KakaoMapController? mapController;
  Set<Marker> markers = {}; // 마커 변수
  bool _mounted = true;
  bool _marketDataStatus = true;
  bool _marketDescriptionStatus = true;
  bool _dataChange = false;
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _partnershipRequestModel = Provider.of<PartnershipRequestModel>(context);
    _partnershipRequestModel.addListener(_updateState);
    _updateMap();
  }

  @override
  void dispose() {
    _partnershipRequestModel.removeListener(_updateState);
    _mounted = false;
    super.dispose();
  }

  void _updateState() {
    if (_mounted) {
      setState(() {});
    }
  }

  void _updateMap() {
    if (_mounted &&
        _partnershipRequestModel.selectedLatitude != null &&
        _partnershipRequestModel.selectedLongitude != null) {
      setState(() {
        markers.clear();
        markers.add(Marker(
          markerId: UniqueKey().toString(),
          latLng: LatLng(
            _partnershipRequestModel.selectedLatitude!,
            _partnershipRequestModel.selectedLongitude!,
          ),
        ));
      });

      if (mapController != null) {
        mapController!.setCenter(LatLng(
          _partnershipRequestModel.selectedLatitude!,
          _partnershipRequestModel.selectedLongitude!,
        ));
      }
    }
  }

  bool activeSubmitButton() {
    // 등록하기 버튼 활성화하기
    if (_detailAddressController.text.isNotEmpty &&
        _partnershipRequestModel.selectedBusinessAddress != null &&
        _partnershipRequestModel.selectedBusinessName != null &&
        _partnershipRequestModel.selectedBusinessPhone != null &&
        _partnershipRequestModel.selectedLatitude != null &&
        _partnershipRequestModel.selectedLongitude != null &&
        _textEditingController.text.isNotEmpty &&
        _titleController.text.isNotEmpty) {
      setState(() {});
      return true;
    } else {
      setState(() {});

      return false;
    }
  }

  void partnershipRequestSaveData() {
    if (_detailAddressController.text.isNotEmpty ||
        _partnershipRequestModel.selectedBusinessAddress != null ||
        _partnershipRequestModel.selectedBusinessName != null ||
        _partnershipRequestModel.selectedBusinessPhone != null ||
        _partnershipRequestModel.selectedLatitude != null ||
        _partnershipRequestModel.selectedLongitude != null ||
        _textEditingController.text.isNotEmpty ||
        _titleController.text.isNotEmpty) {
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (BuildContext context) {
          return const PartnershipRequestSaveDialog();
        },
      );
    } else {
      Navigator.pop(context);
    }
  }

  bool checkAvailableData() {
    if (_detailAddressController.text.isNotEmpty &&
        _partnershipRequestModel.selectedBusinessAddress != null &&
        _partnershipRequestModel.selectedBusinessName != null &&
        _partnershipRequestModel.selectedBusinessPhone != null &&
        _partnershipRequestModel.selectedLatitude != null &&
        _partnershipRequestModel.selectedLongitude != null &&
        _titleController.text.isNotEmpty) {
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

  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
        print(_image);
      });
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
                SizedBox(
                  child: Column(
                    children: [
                      CustomAppBar(
                        title: '파트너쉽 요청 글쓰기',
                        saveData: partnershipRequestSaveData,
                      ),
                    ],
                  ),
                ),
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
                        Consumer<PartnershipRequestModel>(
                          builder: (context, model, child) {
                            if (model.selectedLatitude == null ||
                                model.selectedLongitude == null) {
                              // 이미지를 선택했을 때
                              if (_image != null) {
                                return Center(
                                  child: SizedBox(
                                    height: secondScreenHeight * 0.246,
                                    width: double.infinity,
                                    child: Image.file(
                                      File(_image!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Container(
                                    height: secondScreenHeight * 0.246,
                                    width: double.infinity,
                                    color: const Color(0xffc1c1c1),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.camera_alt_rounded,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        SizedBox(height: screenHeight * 0.0047),
                                        const Text(
                                          '이미지 불러오기',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'PretendardSemiBold',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
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
                                    _updateMap();
                                  },
                                  markers: markers.toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        //------------------------------------------------------------------
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
                                    initialValue: _partnershipRequestModel
                                            .selectedBusinessName ??
                                        '',
                                    dataStatus: _marketDataStatus,
                                  ),
                                  SizedBox(height: secondScreenHeight * 0.011),
                                  NewWidget(
                                    title: '업체위치',
                                    initialValue: _partnershipRequestModel
                                            .selectedBusinessAddress ??
                                        '',
                                    dataStatus: _marketDataStatus,
                                  ),
                                  SizedBox(height: secondScreenHeight * 0.011),
                                  Row(
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
                                    initialValue: _partnershipRequestModel
                                            .selectedBusinessPhone ??
                                        '',
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
                                  PartnershipRequestFormButton(
                                    getImage: getImage,
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
                Container(
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
                          partnershipRequest(
                            _titleController.text,
                            _partnershipRequestModel.selectedBusinessName!,
                            _partnershipRequestModel.selectedBusinessAddress!,
                            _detailAddressController.text,
                            _textEditingController.text,
                            _partnershipRequestModel.selectedBusinessPhone!,
                            _partnershipRequestModel.selectedLatitude!,
                            _partnershipRequestModel.selectedLongitude!,
                          );
                          _dataChange = true;
                          _partnershipRequestModel.clearSelectedBusiness();
                          Navigator.pop(context, _dataChange);
                        }
                      },
                      child: const Text(
                        '등록하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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
        ),
      ),
    );
  }
}
