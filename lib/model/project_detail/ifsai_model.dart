import 'package:freezed_annotation/freezed_annotation.dart';

part 'ifsai_model.freezed.dart';

@freezed
class IfsaiModel with _$IfsaiModel {
  const factory IfsaiModel({
    @Default('잎사이') String projectName,
    @Default('IFSAI') String projectNameEn,
    @Default('소상공인을 위한 간편 매장 관리 솔루션') String projectPurpose,
    @Default([
      '직관적인 매장 관리 대시보드',
      '실시간 매출 분석 및 통계',
      '재고 관리 시스템',
      '고객 관리 기능',
      '모바일 반응형 웹 지원',
    ])
    List<String> coreFeatures,
    @Default([
      'Flutter',
      'Bloc/Cubit',
      'Dio',
      'Get_it (DI)',
      'Injectable',
      'Freezed',
      'Build_runner',
      'Go_router',
      'Firebase',
    ])
    List<String> libraries,
    @Default([
      'assets/Images/project_img/ifsai_screen_1.png',
      'assets/Images/project_img/ifsai_screen_2.png',
      'assets/Images/project_img/ifsai_screen_3.png',
      'assets/Images/project_img/ifsai_screen_4.png',
    ])
    List<String> screenshots,
    @Default({
      'lib/': [
        'main.dart',
        'core_service/',
        'page/',
        'model/',
        'service/',
        'components/',
        'constants/',
      ],
      'core_service/': [
        'di/injector.dart',
        'router/app_router.dart',
        'util/device_info_size.dart',
      ],
      'page/': [
        'home_page/',
        'product_page/',
        'management_page/',
        'analytics_page/',
      ],
      'model/': ['user_model.dart', 'product_model.dart', 'sales_model.dart'],
    })
    Map<String, List<String>> libStructure,
    @Default([
      '복잡한 상태 관리를 위한 Clean Architecture 적용',
      'MVVM 패턴으로 코드 가독성 향상',
      '5만줄 이상의 대규모 코드베이스 관리',
      '실시간 데이터 동기화 문제 해결',
      'TestFlight를 통한 협업 배포 경험',
    ])
    List<String> problemsSolved,
    @Default('https://github.com/location132/IFSAI') String githubUrl,
    @Default([
      'Flutter',
      'Dart',
      'Clean Architecture',
      'MVVM Pattern',
      'Bloc/Cubit',
      'Firebase',
      'DI (Dependency Injection)',
      'TestFlight',
    ])
    List<String> techStack,
    @Default(false) bool isInitialized,
    @Default(false) bool showAnimation,
  }) = _IfsaiModel;
}
