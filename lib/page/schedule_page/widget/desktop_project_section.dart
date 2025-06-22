import 'package:flutter/material.dart';
import 'project_view/general_projects_desktop_view.dart';
import 'project_view/flutter_web_desktop_item.dart';
import 'project_view/rive_desktop_view.dart';

class DesktopProjectSection extends StatelessWidget {
  const DesktopProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const Text(
              '곧 오픈됩니다.\n이정원의 프로젝트 포트폴리오',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade800),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GeneralProjectsDesktopView(),
                  SizedBox(height: 24),
                  FlutterWebDesktopItem(),
                  SizedBox(height: 24),
                  RiveDesktopView(),
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
