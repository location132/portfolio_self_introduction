import 'package:flutter/material.dart';

import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

class ProfileButtonScreen extends StatelessWidget {
  final int chapterNumber;
  final Function(int chapterNumber, bool isContinue) onTap;
  final Function() onBackButtonTap;
  const ProfileButtonScreen({
    super.key,
    required this.chapterNumber,
    required this.onTap,
    required this.onBackButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 170.sh),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: SizedBox(
                    height: 610.sh,
                    child: Center(
                      child: Stack(
                        children: [
                          AnimatedOpacity(
                            opacity: 0.0,
                            duration: const Duration(seconds: 0),
                            child:
                                Image.asset('assets/images/profile_card.png'),
                          ),
                          Positioned.fill(
                            top: 14.sh,
                            left: 13.sh,
                            right: 13.sh,
                            bottom: 12.sh,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 25),
                                    GestureDetector(
                                      onTap: () {
                                        onBackButtonTap();
                                      },
                                      child: const AnimatedOpacity(
                                        opacity: 0.0,
                                        duration: Duration(seconds: 0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Icon(Icons.arrow_back,
                                              color: Colors.white, size: 20),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        onTap(chapterNumber, true);
                                      },
                                      child: AnimatedOpacity(
                                        opacity: 0.0,
                                        duration: const Duration(seconds: 0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8),
                                                  width: 220,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFDF6EC),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      '이어서 보기',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xFF5D4037),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            GestureDetector(
                                              onTap: () {
                                                onTap(chapterNumber, false);
                                              },
                                              child: const AnimatedOpacity(
                                                opacity: 0.0,
                                                duration: Duration(seconds: 0),
                                                child: Text(
                                                  '다음에 보기',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white70,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
