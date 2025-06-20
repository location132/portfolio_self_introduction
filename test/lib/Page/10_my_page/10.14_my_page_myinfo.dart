import 'package:flutter/material.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/Page/10_my_page/10.14.1_my_page_myinfo_viewmode.dart';
import 'package:my_dream/Page/10_my_page/10.14.2_my_page_myinfo_editmode.dart';

class MyPageMyInfo extends StatefulWidget {
  const MyPageMyInfo({Key? key}) : super(key: key);

  @override
  _MyPageMyInfoState createState() => _MyPageMyInfoState();
}

class _MyPageMyInfoState extends State<MyPageMyInfo> {
  bool _isEditMode = false;

  void _toggleEditMode() {
    setState(() {
      _isEditMode = !_isEditMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.036),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.016),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      const CustomAppBar(
                        title: '내 정보 관리',
                      ),
                      if (!_isEditMode)
                        Positioned(
                          right: 0,
                          child: PopupMenuButton<String>(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.more_vert,
                              size: screenWidth * 0.055,
                            ),
                            offset: Offset(0, screenHeight * 0.042),
                            onSelected: (String result) {
                              if (result == 'edit') {
                                _toggleEditMode();
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'edit',
                                child: Text('수정하기'),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025),
                ],
              ),
            ),
            Expanded(
              child: _isEditMode
                  ? MyPageMyInfoEditmode(onSave: _toggleEditMode)
                  : MyPageMyInfoViewmode(onEdit: _toggleEditMode),
            ),
          ],
        ),
      ),
    );
  }
}
