import 'package:flutter/material.dart';

class MyPageMyInfoEditmode extends StatefulWidget {
  final VoidCallback onSave;

  const MyPageMyInfoEditmode({super.key, required this.onSave});

  @override
  State<MyPageMyInfoEditmode> createState() => _MyPageMyInfoEditmodeState();
}

class _MyPageMyInfoEditmodeState extends State<MyPageMyInfoEditmode> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _schoolController;

  final Map<String, String> _userTestData = const {
    'name': '잎사이',
    'phone': '010-1234-5678',
    'school': '건국대학교',
    'email': 'ifsai1234@naver.com',
  };

  @override
  void initState() {
    super.initState();
    // 컨트롤러 초기화
    _nameController = TextEditingController(text: _userTestData['name']);
    _phoneController = TextEditingController(text: _userTestData['phone']);
    _schoolController = TextEditingController(text: _userTestData['school']);
  }

  @override
  void dispose() {
    // 컨트롤러 해제
    _nameController.dispose();
    _phoneController.dispose();
    _schoolController.dispose();
    super.dispose();
  }

  // 저장 처리 메서드
  void _handleSave() {
    // 여기서 데이터 저장 로직 구현
    final updatedData = {
      'name': _nameController.text,
      'phone': _phoneController.text,
      'school': _schoolController.text,
    };

    // 데이터 저장 후 콜백 호출
    widget.onSave();
  }

  Widget _buildInfoSection(String label, dynamic controller) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(screenWidth * 0.068, screenHeight * 0.008,
          screenWidth * 0.068, screenHeight * 0.004),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xffc1c1c1),
              fontSize: 16,
              fontFamily: 'Pretendard',
            ),
          ),
          SizedBox(height: screenHeight * 0.010),
          Container(
            height: screenHeight * 0.025,
            child: label == '계정'
                ? Text(
                    _userTestData['email'] ?? '',
                    style: const TextStyle(
                      color: Color.fromRGBO(142, 142, 142, 1),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                    ),
                  )
                : label == '학교'
                    ? Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.068),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                  isDense: true,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // 학교인증 처리
                              },
                              child: const Text(
                                '학교인증',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Pretendard-Regular',
                                  color: Color.fromRGBO(142, 142, 142, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomDivider(String label) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.757,
      height: screenHeight * 0.002,
      margin: EdgeInsets.symmetric(
          vertical: screenHeight * 0.008, horizontal: screenWidth * 0.068),
      color: label == '계정' ? const Color(0xffdbdbdb) : const Color(0xff6fbf8a),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.036),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: screenWidth * 0.227,
                      height: screenHeight * 0.105,
                      decoration: const BoxDecoration(
                        color: Color(0xffc1c1c1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: screenWidth * 0.085,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: screenWidth * 0.064,
                        height: screenHeight * 0.029,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF8E8E8E),
                            width: screenWidth * 0.003,
                          ),
                        ),
                        child: Icon(
                          Icons.edit,
                          size: screenWidth * 0.045,
                          color: Color(0xFF8E8E8E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              _buildInfoSection('이름', _nameController),
              _buildCustomDivider('이름'),
              _buildInfoSection('전화번호', _phoneController),
              _buildCustomDivider('전화번호'),
              _buildInfoSection('학교', _schoolController),
              _buildCustomDivider('학교'),
              _buildInfoSection('계정', _userTestData['email']),
              _buildCustomDivider('계정'),
              SizedBox(height: screenHeight * 0.025),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.036,
          right: screenWidth * 0.036,
          bottom: MediaQuery.of(context).padding.bottom +
              screenWidth * 0.036, // SafeArea 고려
        ),
        child: Container(
          width: screenWidth * 0.822,
          height: screenHeight * 0.052,
          child: ElevatedButton(
            onPressed: _handleSave,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff6fbf8a),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 0,
            ),
            child: const Text(
              '저장하기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
