import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class AccountTransferDialog extends StatefulWidget {
  final String? targetEmail;
  const AccountTransferDialog({super.key, required this.targetEmail});

  @override
  State<AccountTransferDialog> createState() => _AccountTransferDialogState();
}

class _AccountTransferDialogState extends State<AccountTransferDialog> {
  bool _isIndicator = false;
  bool _isIndicatorOpacity = false;
  bool _isFiltter = false;

  void _isChangeSNSLogin(String targetEmail) async {
    setState(() {
      _isFiltter = true;
      _isIndicatorOpacity = true;
      _isIndicator = true;
    });
    bool result = await changeSNSLogin(targetEmail);
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isIndicatorOpacity = false;
      _isFiltter = false;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isIndicator = false;
      _isFiltter = false;
    });
    if (result && mounted) {
      Navigator.pushNamed(context, '/StudentsSuccessScreen');
    } else if (!result) {
      // 이전 실패
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final loginStatus = Provider.of<JoinModel>(context, listen: false);
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.3, sigmaY: 2.3),
          child: Dialog(
            backgroundColor: Colors.white,
            insetPadding: const EdgeInsets.only(left: 30, right: 30),
            child: Wrap(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: '해당 이메일 ',
                              style: TextStyle(
                                color: Color(0xff5b5b5b),
                                fontFamily: 'Pretendard',
                              ),
                            ),
                            TextSpan(
                              text: loginStatus.isUserEmail,
                              style: const TextStyle(
                                color: Color(0xff6fbf8a),
                                fontFamily: 'Pretendard',
                              ),
                            ),
                            const TextSpan(
                              text: '(는)은\n이미 학생인증이 완료된 이메일입니다.',
                              style: TextStyle(
                                color: Color(0xff5b5b5b),
                                fontFamily: 'Pretendard',
                              ),
                            ),
                          ],
                        ),
                        style: const TextStyle(
                          color: Color(0xff5b5b5b),
                          fontFamily: 'Pretendard',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '아래의 확인 버튼을 클릭하면\n기존 데이터가 현재 계정으로 이전됩니다.',
                        style: TextStyle(
                          color: Color(0xff5b5b5b),
                          fontFamily: 'Pretendard',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            _isChangeSNSLogin(widget.targetEmail!);
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xff6fbf8a),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(
                              child: Text(
                                '확인',
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
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: AnimatedOpacity(
            opacity: _isIndicatorOpacity ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: BackdropFilter(
              filter: _isFiltter
                  ? ImageFilter.blur(sigmaX: 2.3, sigmaY: 2.3)
                  : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Center(
                child: AnimatedOpacity(
                  opacity: _isIndicatorOpacity ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: _isIndicator
                      ? SizedBox(
                          width: screenHeight * 0.118,
                          height: screenHeight * 0.118,
                          child: const CircularProgressIndicator(
                            strokeCap: StrokeCap.round,
                            strokeWidth: 12,
                            backgroundColor: Color(0xffeeeeee),
                            color: Color(0xff6fbf8a),
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
