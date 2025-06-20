import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/3_student_email_page/3.3_error_dialog.dart';
import 'package:my_dream/Page/3_student_email_page/3.7_student_account_transfer_dialog.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class UnivMailCheck extends StatefulWidget {
  final Function(bool) isLoading;

  const UnivMailCheck({super.key, required this.isLoading});

  @override
  State<UnivMailCheck> createState() => _UnivMailCheckState();
}

class _UnivMailCheckState extends State<UnivMailCheck> {
  final FocusNode _codeFocusNode = FocusNode();

  bool _isInputValid = false;
  bool _obsMailCode = true;
  bool _isErrorMailCode = false;
  String _isMailCode = '';
  bool _isOneTouch = true;
  String _errorMessage = '';

  // 인증번호 자리수 검증
  void checkMailcode(String checkCode) {
    _isMailCode = checkCode.trim();

    if (_isMailCode.length >= 6) {
      setState(() {
        _isInputValid = true;
      });
    } else {
      setState(() {
        _isInputValid = false;
      });
    }
  }

  // 인증번호 서버 검증
  void sendToCheckEmailCode(String code) async {
    if (_isOneTouch) {
      setState(() {
        _errorMessage = '';
        widget.isLoading(true);
        _isOneTouch = false;
        _isErrorMailCode = false;
      });

      final userEmail =
          Provider.of<JoinModel>(context, listen: false).isUserEmail;
      try {
        var isResult = await emailCode(code, userEmail);
        await Future.delayed(const Duration(seconds: 2));
        switch (isResult['status']) {
          case 'success':
            if (mounted) {
              final loginModel =
                  Provider.of<LoginModel>(context, listen: false);
              loginModel.setIsStudent(true);
            }
            setState(() {
              widget.isLoading(false);
            });
            await Future.delayed(const Duration(seconds: 1));
            if (mounted) {
              Navigator.pushReplacementNamed(context, '/StudentsSuccessScreen');
            }
            break;
          //------에러코드 -5-----
          case 'errorCode: -5':
            setState(() {
              widget.isLoading(false);
            });
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              _isErrorMailCode = true;
              _errorMessage = '인증번호가 일치하지 않습니다';
              _isOneTouch = true;
            });
          //------에러코드 -21-----
          case 'errorCode: -21':
            setState(() {
              widget.isLoading(false);
            });
            await Future.delayed(const Duration(seconds: 1));
            handleLoginResult('errorCode: -21',
                targetEmail: isResult['targetEmail']);
          //--------------------
          default:
            print('Unhandled case: ${isResult['status']}');
            break;
        }
      } catch (e) {
        null;
      }
    }
  }

// 인증번호 보이기
  void obsChange() {
    setState(() {
      if (_obsMailCode) {
        _obsMailCode = !_obsMailCode;
      } else {
        _obsMailCode = true;
      }
    });
  }

  //다이아로그
  void handleLoginResult(String errorType, {String? targetEmail = ''}) {
    if (errorType == 'codeSendError') {
      showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (BuildContext context) {
          return const ResendEmail();
        },
      );
    } else if (errorType == 'errorCode: -21') {
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (BuildContext context) {
          return AccountTransferDialog(targetEmail: targetEmail);
        },
      );
    }
  }

  // 키보드 올라오기
  void toggleKeyboard() async {
    final emailStatus = Provider.of<JoinModel>(context, listen: false);

    await Future.delayed(const Duration(milliseconds: 400));
    setState(() {
      _codeFocusNode.requestFocus();
      emailStatus.setIstryEmailCode(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final emailStatus = Provider.of<JoinModel>(context);

    if (emailStatus.istryEmailCode) {
      toggleKeyboard();
    }

    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            enabled: emailStatus.isEmailState,
            focusNode: _codeFocusNode,
            obscureText: _obsMailCode,
            decoration: InputDecoration(
              hintText: '인증번호 입력',
              hintStyle: const TextStyle(
                  color: Color(0xffc1c1c1),
                  fontFamily: 'Pretendard',
                  fontSize: 13),
              enabledBorder: OutlineInputBorder(
                borderSide: !_isErrorMailCode
                    ? const BorderSide(color: Color(0xffc1c1c1), width: 1.5)
                    : const BorderSide(color: Color(0xffff3636), width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFE0E0E0),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: !_isErrorMailCode
                    ? const BorderSide(color: Color(0xFFE0E0E0), width: 1.5)
                    : const BorderSide(color: Color(0xffff3636), width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: Transform.translate(
                offset: const Offset(0, -2),
                child: CupertinoButton(
                  onPressed: obsChange,
                  child: const Icon(
                    CupertinoIcons.eye_slash,
                    color: Color(0xff757575),
                  ),
                ),
              ),
            ),
            onChanged: (value) {
              checkMailcode(value);
            },
          ),
        ),
        const SizedBox(height: 5),
        _isErrorMailCode
            ? Row(
                children: [
                  Text(
                    _errorMessage,
                    style: const TextStyle(
                      color: Color(0xffff3636),
                      fontSize: 10,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Text(
                    _errorMessage,
                    style: const TextStyle(
                      color: Colors.transparent,
                      fontSize: 10,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ],
              ),
        SizedBox(height: screenHeight * 0.025),
        IgnorePointer(
          ignoring: !_isOneTouch,
          child: SizedBox(
            width: double.maxFinite,
            height: 50,
            child: TextButton(
              onPressed: _isInputValid
                  ? () {
                      sendToCheckEmailCode(_isMailCode);
                    }
                  : null,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  _isInputValid
                      ? const Color(0xFF6FBF8A)
                      : const Color(0xff8e8e8e),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: const Text(
                '확인',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'protected',
                    fontSize: 18,
                    fontWeight: FontWeight.w100),
              ),
            ),
          ),
        ),
        emailStatus.isEmailState
            ? Column(children: [
                TextButton(
                  onPressed: () {
                    handleLoginResult('codeSendError');
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                color: Color(0xff757575),
                              )),
                            ),
                            child: const Text(
                              '인증번호를 받지 못하셨나요?',
                              style: TextStyle(
                                color: Color(0xff757575),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ])
            : const Column(
                children: [
                  Text(
                    '인증번호를 받지 못하셨나요?',
                    style: TextStyle(
                      color: Colors.transparent,
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
