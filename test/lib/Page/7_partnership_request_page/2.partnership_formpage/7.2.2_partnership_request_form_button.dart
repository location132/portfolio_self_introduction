import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PartnershipRequestFormButton extends StatefulWidget {
  final Future<dynamic> Function(ImageSource) getImage; //이미지를 담을 변수 선언
  const PartnershipRequestFormButton({super.key, required this.getImage});

  @override
  State<PartnershipRequestFormButton> createState() =>
      _PartnershipRequestFormButtonState();
}

class _PartnershipRequestFormButtonState
    extends State<PartnershipRequestFormButton> {
  //이미지를 가져오는 함수

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final secondScreenHeight = screenHeight * 0.722;

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: screenHeight * 0.2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                      await Navigator.pushNamed(context, '/PartnershipSearch',
                          arguments: 'requestPage');
                    },
                    child: const Text(
                      '지도 불러오기',
                      style: TextStyle(fontSize: 21, color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.015,
                  ),
                  const Divider(
                    color: Color(0xffeeeeee),
                  ),
                  SizedBox(
                    height: screenHeight * 0.015,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pop(context);
                      widget.getImage(ImageSource.gallery);
                    },
                    child: const Text(
                      '갤러리에서 가져오기',
                      style: TextStyle(fontSize: 21, color: Colors.blue),
                    ),
                  )
                ],
              ),
            ); // 모달 내부 디자인 영역
          },
        );

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
    );
  }
}
