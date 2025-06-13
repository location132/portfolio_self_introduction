import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/project_card.dart';

class ProjectContents extends StatefulWidget {
  final IfsaiState state;
  const ProjectContents({super.key, required this.state});

  @override
  State<ProjectContents> createState() => _ProjectContentsState();
}

class _ProjectContentsState extends State<ProjectContents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.lerp(
        Colors.white,
        Colors.black,
        widget.state.backgroundDarkness,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 100),
          // 1번 프로젝트
          ProjectCard(
            imagePath: 'assets/Images/ifsai_img/web_project_1.png',
            imageDescription: '프로젝트 화면의 일부분입니다.',
            title: '신입인데?\n재미있는 패턴을 사용해요',
            techStack: [
              'MVVM',
              'Clean Architecture',
              'Repository Pattern',
              'BLoC / Cubit',
              'Provider (보조 상태 관리로 사용)',
              'Dependency Injection (GetIt + Injectable)',
            ],
            bottomDescription: '위 기술을 클릭해주세요\n패턴을 자세하게 볼 수 있어요',
          ),
          SizedBox(height: 200),
          // 2번 프로젝트
          ProjectCard(
            imagePath: 'assets/Images/ifsai_img/web_project_2.png',
            imageDescription: '프로젝트 화면의 일부분입니다.',
            title: '데이터 관리도 역시?\n이정원',
            techStack: [
              'Freezed',
              'json_serializable\n  json_annotation 자동 JSON 직렬화',
              'Isar 로컬 NoSQL DB',
              'SharedPreferences\n  Flutter Secure Storage 로컬 캐싱',
              'MemoryCache\n  Dio Cache Interceptor - 메모리 및 네트워크 캐싱',
            ],
            bottomDescription: '위 기술을 클릭해주세요\n데이터 처리 방식을 자세하게 볼 수 있어요',
            isReversed: true,
          ),
        ],
      ),
    );
  }
}
