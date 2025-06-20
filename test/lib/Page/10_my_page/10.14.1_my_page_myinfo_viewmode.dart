import 'package:flutter/material.dart';

class MyPageMyInfoViewmode extends StatefulWidget {
  final VoidCallback onEdit;

  const MyPageMyInfoViewmode({Key? key, required this.onEdit})
      : super(key: key);

  @override
  State<MyPageMyInfoViewmode> createState() => _MyPageMyInfoViewmodeState();
}

class _MyPageMyInfoViewmodeState extends State<MyPageMyInfoViewmode> {
  final Map<String, String> _userTestData = const {
    'name': '잎사이',
    'phone': '010-1234-5678',
    'school': '건국대학교',
    'email': 'ifsai1234@naver.com',
  };

  void _handleLogout() {
    // 로그아웃 처리 로직
    setState(() {
      // 필요한 상태 업데이트
    });
  }

  void _handleWithdrawal() {
    // 회원탈퇴 처리 로직
    setState(() {
      // 필요한 상태 업데이트
    });
  }

  void _handleChangeAccount() {
    // 다른 계정으로 로그인 처리 로직
    setState(() {
      // 필요한 상태 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
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
              ),
              SizedBox(height: screenHeight * 0.025),
              _buildInfoSection('이름', _userTestData['name'] ?? ''),
              _buildCustomDivider(),
              _buildInfoSection('전화번호', _userTestData['phone'] ?? ''),
              _buildCustomDivider(),
              _buildInfoSection('학교', _userTestData['school'] ?? ''),
              _buildCustomDivider(),
              _buildInfoSection('계정', _userTestData['email'] ?? ''),
              _buildCustomDivider(),
              const SizedBox(height: 24),
              Container(
                height: screenHeight * 0.039,
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.068),
                width: screenWidth * 0.757,
                child: ElevatedButton(
                  onPressed: _handleChangeAccount,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(
                          color: Color(0xff6fbf8a), width: screenWidth * 0.003),
                    ),
                    elevation: 0,
                    minimumSize: Size.fromHeight(screenHeight * 0.039),
                  ),
                  child: const Text(
                    '다른 계정으로 로그인',
                    style: TextStyle(
                      color: Color(0xff6fbf8a),
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.017),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.068),
                child: Text(
                  '회원탈퇴',
                  style: TextStyle(
                    color: Colors.grey[600],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(String label, String value) {
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
          label == '계정'
              ? Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.068),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        value,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(142, 142, 142, 1),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // 로그아웃 처리
                        },
                        child: const Text(
                          '로그아웃',
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
              : Text(
                  value,
                  style: const TextStyle(fontSize: 16),
                ),
        ],
      ),
    );
  }

  Widget _buildCustomDivider() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.757,
      height: screenHeight * 0.002,
      margin: EdgeInsets.symmetric(
          vertical: screenHeight * 0.008, horizontal: screenWidth * 0.068),
      color: const Color(0xffdbdbdb),
    );
  }
}
