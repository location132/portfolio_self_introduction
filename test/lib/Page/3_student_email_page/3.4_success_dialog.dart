import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailSuccessDiaLog extends StatefulWidget {
  const EmailSuccessDiaLog({super.key});

  @override
  State<EmailSuccessDiaLog> createState() => _EmailSuccessDiaLogState();
}

class _EmailSuccessDiaLogState extends State<EmailSuccessDiaLog>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      final emailStatus = Provider.of<JoinModel>(context, listen: false);
      Navigator.pop(context);
      emailStatus.setIstryEmailCode(true);
    }
  }

  void _univUrl() async {
    final url = Uri.parse(
        'https://kumail.konkuk.ac.kr/adfs/ls/?lc=1042&wa=wsignin1.0&wtrealm=urn%3afederation%3aMicrosoftOnline');
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
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
                  const SizedBox(height: 40),
                  const Text(
                    '인증코드를 받기위해 \n학교 이메일 창으로 넘어갑니다:) ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff5b5b5b),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        _univUrl();
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
    );
  }
}
