import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DesktopHeaderSection extends StatelessWidget {
  const DesktopHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Text(
              'Version 2.0\n포트폴리오 웹사이트 리모델링과 함께\n더욱 많은 프로젝트들을 소개하겠습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              '현재는 잎사이 프로젝트만 자세한 내용을 보실 수 있습니다.\n기술블로그는 8번까지만 업로드 되었습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey, height: 1.6),
            ),
            const SizedBox(height: 60),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade800),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 120,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => context.go('/project-detail/ifsai'),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade700),
                              ),
                              child: const Text(
                                '잎사이 프로젝트 보기',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: Text(
                              '5만줄 이상 코드 규모에 MVVM, Servicev패턴 Clean Architecture를 적용하고, TestFlight를 통해 협업한 프로젝트입니다.',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      height: 120,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => context.go('/tech-blog'),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade700),
                              ),
                              child: const Text(
                                '기술블로그 페이지로 이동하기',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: Text(
                              '다른 블로그와 다르게\n개념 20% 프로젝트에 적용하며 직접 구현한 기술 80%로 이루어진 특별한 기술블로그',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                height: 1.4,
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
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
