import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/code_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/story_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/subtitle_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/title_text_tech.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DomainLayerMobile extends StatelessWidget {
  final bool isBackgroundColorWhite;

  const DomainLayerMobile({super.key, required this.isBackgroundColorWhite});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextTechBlog(
          title: '도메인 계층 (Domain Layer)',
          isBackgroundColor: isBackgroundColorWhite,
        ),
        SizedBox(height: 30.h),
        SubtitleTextTechBlog(
          title: '비즈니스 로직의 핵심\n    앱의 "무엇을"을 정의하는 계층',
          isBackgroundColor: isBackgroundColorWhite,
        ),
        SizedBox(height: 30.h),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '도메인 계층은 Clean Architecture의 가장 안쪽 계층으로,\n'
              '외부 프레임워크나 기술에 의존하지 않는 순수한 비즈니스 로직을 담당합니다.\n\n'
              '"어떻게 구현할지"가 아닌 "무엇을 해야 하는지"에 집중하는 계층입니다.',
        ),
        SizedBox(height: 80.h),

        // 도메인 모델
        SubtitleTextTechBlog(
          title: '모델 (Domain Models)',
          isBackgroundColor: isBackgroundColorWhite,
        ),
        SizedBox(height: 30.h),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '도메인 모델은 비즈니스 개념을 코드로 표현한 것입니다.\n'
              '제가 사용한 방법은 freezed를 사용해 불변성을 보장하고, 비즈니스 규칙을 반영합니다.\n\n'
              '제 프로젝트에서 사용하는 도메인 모델들을 소개하겠습니다',
        ),
        SizedBox(height: 30.h),
        CodeBlock(
          title: '''잎사이 프로젝트 - 매장(Market) 도메인 모델''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
@freezed
class MarketModel with _$MarketModel {
  const factory MarketModel({
    required int marketId,
    required String mainCategory,
    required double locationX,
    required double locationY,
    required String marketImage,
    required String marketName,
    required String marketDescription,
    required String detailAddress,
    String? eventMessage,
    required String openTime,
    required String closeTime,
    required String closedDays,
    required double averageReviewScore,
    required int reviewCount,
    required int maxDiscountRate,
  }) = _MarketModel;
}
''',
        ),
        SizedBox(height: 30.h),
        CodeBlock(
          title: '''포트폴리오 프로젝트 - 배너(Banner) 도메인 모델''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
@freezed
class BannerModel with _$BannerModel {
  const factory BannerModel({
    @Default(false) bool isPlayerActive,
    @Default(false) bool player,
    @Default(0) int currentTitleIndex,
    @Default(false) bool isTitleChanging,
    @Default(false) bool isButtonVisible,
    @Default(false) bool isBannerActive,
    @Default(1.0) double riveOpacity,
    @Default(true) bool isRiveVisible,
  }) = _BannerModel;
}
''',
        ),
        SizedBox(height: 30.h),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '도메인 모델의 특징:\n\n'
              '✅ 비즈니스 개념 반영: MarketModel은 실제 매장의 속성들을 정의\n'
              '✅ 불변성 보장: freezed를 통해 데이터 일관성 유지\n'
              '✅ 비즈니스 규칙 적용: 필수/선택 필드로 비즈니스 제약사항 표현\n'
              '✅ 기술 독립성: UI나 DB 기술에 의존하지 않는 순수한 데이터 구조\n\n',
        ),
        SizedBox(height: 80.h),

        // 도메인 서비스
        SubtitleTextTechBlog(
          title: '도메인 서비스 (Domain Services)',
          isBackgroundColor: isBackgroundColorWhite,
        ),
        SizedBox(height: 30.h),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '도메인 서비스는 여러 도메인 객체가 협력해야 하는 복잡한 비즈니스 로직을 처리합니다.\n'
              '단일 엔티티에 속하지 않는 도메인 로직들을 캡슐화합니다.',
        ),
        SizedBox(height: 30.h),
        CodeBlock(
          title: '''NaverMapService - 지도와 위치 계산 도메인 로직''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
@singleton
class NaverMapService {
  final NaverMapRemoteRepository _naverMapRemoteRepository;

  NaverMapService(this._naverMapRemoteRepository);

  // 도메인 로직: 지도 초기 애니메이션 시퀀스
  Future<void> playInitialAnimation(NaverMapController controller) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    
    // 1단계: 학교 중심으로 회전
    await controller.updateCamera(
      NCameraUpdate.withParams(
        zoom: 15.77,
        tilt: 59.9,
        bearing: 310,
        target: const NLatLng(36.94965229849843, 127.90843762544843),
      )..setAnimation(
          animation: NCameraAnimation.fly,
          duration: const Duration(milliseconds: 2000)),
    );

    // 2단계: 줌 아웃으로 전체 지역 표시
    await controller.updateCamera(
      NCameraUpdate.withParams(
        zoom: 12.3,
        bearing: 0,
        tilt: 0,
        target: const NLatLng(36.971336282566874, 127.91767020963579),
      )..setAnimation(duration: const Duration(milliseconds: 2500)),
    );
  }

  // 도메인 로직: 사용자와 매장 간 거리 계산
  double calculateDistance(NLatLng userLocation, NLatLng markerLocation) {
    if (userLocation.latitude == 0 || userLocation.longitude == 0) {
      return 0.0;
    } else {
      return userLocation.distanceTo(markerLocation);
    }
  }
}
''',
        ),
        SizedBox(height: 30.h),
        CodeBlock(
          title: '''LocationService - 위치 권한과 GPS 관리 도메인 로직''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
@singleton
class LocationService {
  // 도메인 로직: 위치 권한 상태 확인과 처리
  Future<LocationPermission> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    switch (permission) {
      case LocationPermission.denied:
        // 비즈니스 규칙: 처음 거부된 경우 재요청
        permission = await Geolocator.requestPermission();
        return permission;

      case LocationPermission.deniedForever:
        // 비즈니스 규칙: 영구 거부시 설정 유도
        return LocationPermission.deniedForever;

      case LocationPermission.whileInUse:
      case LocationPermission.always:
        // 이미 권한이 있는 경우
        return permission;

      case LocationPermission.unableToDetermine:
        // 웹 환경 등에서 권한 확인 불가
        return LocationPermission.denied;
    }
  }

  // 도메인 로직: 현재 위치를 도메인 모델로 변환
  Future<LocationModel> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 5),
      ),
    );

    // 기술적 Position 객체를 도메인 LocationModel로 변환
    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
''',
        ),
        SizedBox(height: 30.h),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '도메인 서비스의 특징:\n\n'
              '✅ 복합 비즈니스 로직: 여러 도메인 객체가 협력하는 로직 캡슐화\n'
              '✅ 순수 도메인 로직: UI나 DB에 의존하지 않는 핵심 비즈니스 규칙\n'
              '✅ 재사용 가능성: 다양한 Presentation 계층에서 활용 가능\n'
              '✅ 테스트 용이성: 외부 의존성 없이 독립적으로 테스트 가능\n\n'
              '예시처럼 지도 애니메이션 시퀀스나 위치 권한 처리 로직은\n'
              '순수한 비즈니스 규칙으로 도메인 계층에 속합니다.',
        ),
        SizedBox(height: 80.h),

        // 값 객체와 열거형
        SubtitleTextTechBlog(
          title: '값 객체와 열거형 (Value Objects & Enums)',
          isBackgroundColor: isBackgroundColorWhite,
        ),
        SizedBox(height: 30.h),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '도메인의 개념을 명확하게 표현하는 작은 단위의 객체들입니다.\n'
              '비즈니스 규칙과 제약사항을 타입 시스템으로 표현합니다.',
        ),
        SizedBox(height: 30.h),
        CodeBlock(
          title: '''도메인 열거형과 값 객체들''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
// 초기화 상태 - 앱의 생명주기 표현
enum InitState { inactive, active }

// 기기 타입 - 반응형 UI 도메인 개념
enum DeviceType { desktop, tablet, mobile }

// 위치 권한 상태 - 위치 서비스 도메인 개념  
enum LocationPermission { 
  denied, 
  deniedForever, 
  whileInUse, 
  always, 
  unableToDetermine 
}

// 메뉴 옵션 도메인 모델
@freezed
class MenuOptionCategory with _$MenuOptionCategory {
  const factory MenuOptionCategory({
    required String classification,
    required List<MenuOption> options,
    required bool multipleSelection,    // 비즈니스 규칙: 다중 선택 여부
  }) = _MenuOptionCategory;
}

@freezed
class MenuOption with _$MenuOption {
  const factory MenuOption({
    required int menuOptionId,
    required String description,
    required int optionPrice,
    required bool defaultOption,        // 비즈니스 규칙: 기본 선택 옵션
    required bool adultMenu,           // 비즈니스 규칙: 성인 메뉴 여부
  }) = _MenuOption;
}
''',
        ),
        SizedBox(height: 30.h),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '값 객체와 열거형의 역할:\n\n'
              '✅ 도메인 개념 명시: 타입으로 비즈니스 개념을 명확하게 표현\n'
              '✅ 잘못된 상태 방지: 컴파일 타임에 잘못된 값 할당 차단\n'
              '✅ 비즈니스 규칙 반영: multipleSelection, adultMenu 등의 제약사항 표현\n'
              '✅ 가독성 향상: 코드만으로도 비즈니스 의도를 파악 가능\n\n'
              '예를 들어 `DeviceType.mobile`은 단순한 문자열보다\n'
              '훨씬 명확한 의도를 표현합니다.',
        ),
        SizedBox(height: 180.h),
      ],
    );
  }
}
