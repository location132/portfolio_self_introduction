import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'mobile_project_card.dart';

class MobileProjectContents extends StatelessWidget {
  final bool isVisible;

  const MobileProjectContents({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80.h),
        MobileProjectCard(
          imagePath: 'assets/Images/ifsai_img/web_project_1.png',
          imageDescription: '프로젝트 화면의 일부분입니다.',
          title: '신입인데?\n재미있는 패턴을 사용해요',
          techStack: const [
            'MVVM',
            'Clean Architecture',
            'Repository Pattern',
            'BLoC / Cubit',
            'Provider (보조 상태 관리로 사용)',
            'Dependency Injection (GetIt + Injectable)',
          ],
          bottomDescription: '위 기술을 클릭해주세요\n패턴을 자세하게 볼 수 있어요',
          isCardStarted: isVisible,
        ),
        SizedBox(height: 120.h),
        MobileProjectCard(
          imagePath: 'assets/Images/ifsai_img/web_project_2.png',
          imageDescription: '프로젝트 화면의 일부분입니다.',
          title: '데이터 관리도 역시?\n이정원',
          techStack: const [
            'Freezed',
            'json_serializable\n  json_annotation 자동 JSON 직렬화',
            'Isar 로컬 NoSQL DB',
            'SharedPreferences\n  Flutter Secure Storage 로컬 캐싱',
            'MemoryCache\n  Dio Cache Interceptor - 메모리 및 네트워크 캐싱',
          ],
          bottomDescription: '위 기술을 클릭해주세요\n데이터 처리 방식을 자세하게 볼 수 있어요',
          isCardStarted: isVisible,
        ),
        SizedBox(height: 120.h),
      ],
    );
  }
}
