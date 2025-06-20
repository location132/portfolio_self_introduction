import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_dream/Page/3_student_email_page/3.4_success_dialog.dart';
import 'package:my_dream/Page/3_student_email_page/3.5_email_error_dialog.dart';
import 'package:my_dream/Page/3_student_email_page/3.7_loginChageToSns/3.7.1_students_snstoggle_naver.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/core/utils/verifty_form.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class StudentEmailCheck extends StatefulWidget {
  const StudentEmailCheck({super.key});

  @override
  State<StudentEmailCheck> createState() => _StudentEmailCheckState();
}

class _StudentEmailCheckState extends State<StudentEmailCheck> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  bool _isfirst = true; // @ 처음 입력 확인
  bool _isEmailValid = true; // 이메일 확인
  bool _isChangeButton = true; // 인증번호가 아이콘으로 변경
  bool _isShowLoading = false; // 로딩 애니메이션
  bool _isRecursiveFunction = true;
  String _isErrorMessage = '';

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  Artboard? _artboard;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  void _loadRiveFile() async {
    final data = await rootBundle.load('assets/rive/new_file.riv');
    final file = RiveFile.import(data);

    setState(() {
      _artboard = file.mainArtboard;
      _artboard!.addController(SimpleAnimation('Animation 1'));
    });
  }

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);

    return controller;
  }

  // 이메일 자동 완성
  void isVaildEmail(String email) {
    int domainIndex = email.indexOf("@kku.ac.kr");
    if (email.contains('@') && _isfirst && !email.endsWith("kku.ac.kr")) {
      String newEmail = "${email}kku.ac.kr";
      _isfirst = false;
      if (_emailController.text != newEmail) {
        _emailController.text = newEmail;
        _emailController.selection = TextSelection.fromPosition(
          TextPosition(offset: newEmail.length),
        );
      }
    } else if (!email.contains('@') || email.isEmpty) {
      _isfirst = true;
    } else if (domainIndex != -1) {
      String adjustedEmail =
          email.substring(0, domainIndex + "@kku.ac.kr".length);
      _emailController.text = adjustedEmail;
      _emailController.selection = TextSelection.fromPosition(
        TextPosition(offset: adjustedEmail.length),
      );
    }
  }

  // 인증번호 보내기
  Future<void> sendEmailToDio(String email, {int retry = 0}) async {
    final emailStatus = Provider.of<JoinModel>(context, listen: false);
    try {
      setState(() {
        _isChangeButton = false;
        _isEmailValid = true;
        _isShowLoading = true;
      });
      if (emailRegExp.hasMatch(email)) {
        emailStatus.setUserEmailStatus(email);
        await Future.delayed(const Duration(seconds: 1));
        var isSeverResult = await sendStudentEmail(email);
        if (isSeverResult['status'] == 'true') {
          // 서버에서 200을 받았을 떄,
          setState(
            () {
              check.fire();
              _isEmailValid = true; // 이메일 검증 성공
              emailStatus.setEmailStatus(true);
              emailStatus.setRetypeEmail(false);
              _isRecursiveFunction = true;
              handleLoginResult(); // 학교 이메일로 넘어가기
            },
          );
        } else if (isSeverResult['status'] == '네이버') {
          // 네이버로 인증이 되어있을 때,
          setState(() {
            error.fire();
            handleLoginNaver();
          });
        } else if (isSeverResult['status'] == '카카오') {
          // 카카오로 인증이 되어있을 때,
          setState(
            () {
              error.fire();
              handleLoginKakao();
            },
          );
        } else if (isSeverResult['status'] == '구글') {
          // 구글로 인증이 되어있을 때,
          setState(
            () {
              // 구글 인증 성공 처리 로직
            },
          );
        } else if (isSeverResult['status'] == '애플') {
          // 애플로 인증이 되어있을 때,
          setState(
            () {
              // 애플 인증 성공 처리 로직
            },
          );
        } else {
          if (retry == 0) {
            //이메일 형식은 맞지만 서버에서 400 요청을 보냈을 떄,
            return sendEmailToDio(email, retry: ++retry);
          } else {
            await Future.delayed(const Duration(seconds: 2));
            setState(() {
              error.fire();
            });
            await Future.delayed(const Duration(milliseconds: 2500));
            errorLoginResult();
            await Future.delayed(const Duration(milliseconds: 1000));
            setState(() {
              _isErrorMessage = '';
              _isEmailValid = true;
              _isChangeButton = true;
              _isShowLoading = false;
            });
          }
        }
      } else {
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          error.fire();
        });
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          _isEmailValid = false;
          _isChangeButton = true;
          _isShowLoading = false;
          _isErrorMessage = '*  학교 클라우드 이메일을 입력해주세요.';
        });
      }
    } catch (e) {}
  }

//-------------------------------------------------
  void errorLoginResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return const EmailError();
      },
    );
  }

  // 이메일 재 입력
  void _retypeEmail() async {
    setState(() {
      _isRecursiveFunction = false;
      _emailController.text = '';
      _isShowLoading = false;
      _isChangeButton = true;
    });
    await Future.delayed(const Duration(milliseconds: 400));
    setState(() {
      _emailFocusNode.requestFocus();
    });
  }

  //학교 이메일로 넘어가는 로직 다이아로그
  void handleLoginResult() async {
    await Future.delayed(const Duration(milliseconds: 2300));
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (BuildContext context) {
          return const EmailSuccessDiaLog();
        },
      );
    }
  }

// 네이버로 로그인 변경
  void handleLoginNaver() async {
    await Future.delayed(const Duration(milliseconds: 2300));
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (BuildContext context) {
          return const EmailWithNaver();
        },
      );
    }
  }

  // 네이버로 로그인 변경
  void handleLoginKakao() async {
    await Future.delayed(const Duration(milliseconds: 2300));
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (BuildContext context) {
          return const EmailWithNaver();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailStatus = Provider.of<JoinModel>(context);
    if (emailStatus.isRetypeEmail && _isRecursiveFunction) {
      _retypeEmail();
    }

    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            enabled: !_isShowLoading,
            focusNode: _emailFocusNode,
            controller: _emailController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _isEmailValid
                      ? const Color(0xffc1c1c1)
                      : const Color(0xfff64f4f),
                  width: 1.5,
                ),
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
                borderSide: BorderSide(
                  color: _isEmailValid
                      ? const Color(0xFFE0E0E0)
                      : const Color(0xfff64f4f),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: '학교 이메일 입력',
              hintStyle: const TextStyle(
                  color: Color(0xffc1c1c1),
                  fontFamily: 'Pretendard',
                  fontSize: 13),
              suffixIcon: !_isChangeButton
                  ? Visibility(
                      visible: !_isChangeButton,
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: SizedBox(
                          width: 57,
                          height: 50,
                          child: RiveAnimation.asset(
                            "assets/rive/check.riv",
                            onInit: (artboard) {
                              StateMachineController controller =
                                  getRiveController(artboard);
                              check = controller.findSMI("Check") as SMITrigger;
                              error = controller.findSMI("Error") as SMITrigger;
                              reset = controller.findSMI("Reset") as SMITrigger;
                            },
                          ),
                        ),
                      ),
                    )
                  : IconButton(
                      icon: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Container(
                                margin: const EdgeInsets.only(right: 5),
                                decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey)),
                                ),
                                child: const Text(
                                  '인증번호 전송',
                                  style: TextStyle(
                                    color: Color(0xff757575),
                                    fontFamily: 'Pretendard',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        sendEmailToDio(_emailController.text);
                      },
                    ),
              contentPadding: const EdgeInsets.only(left: 15),
            ),
            onChanged: (value) {
              isVaildEmail(value);
            },
            onFieldSubmitted: (value) {
              sendEmailToDio(_emailController.text);
            },
          ),
        ),
        const SizedBox(height: 5),
        !_isEmailValid
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    _isErrorMessage,
                    style: const TextStyle(
                      color: Color(0xffff3636),
                      fontSize: 10,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
