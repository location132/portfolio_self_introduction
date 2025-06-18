import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/mobile_tech_post_title.dart';

class MobileAllPostsList extends StatelessWidget {
  const MobileAllPostsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MobileTechPostTitle(
            number: 1,
            title: 'MVVM',
            tags: '#MVVM  #ViewModel  #Model',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 2,
            title: 'Clean Architecture',
            tags:
                '#Clean Architecture  #Domain  #Presentation  #Repository pattern',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 3,
            title: 'Repository Pattern',
            tags: '#Repository  #Data Layer  #API',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 4,
            title: 'BLoC / Cubit',
            tags: '#BLoC  #Cubit  #State Management',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 5,
            title: 'Provider (보조 상태 관리로 사용)',
            tags: '#Provider  #State Management  #Context',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 6,
            title: 'Dependency Injection (GetIt + Injectable)',
            tags: '#GetIt  #Injectable  #DI',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 7,
            title: 'Freezed',
            tags: '#Freezed  #Immutable  #Code Generation',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 8,
            title: 'json_serializable\njson_annotation 자동 JSON 직렬화',
            tags: '#json_serializable  #json_annotation  #Serialization',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 9,
            title: 'Isar 로컬 NoSQL DB',
            tags: '#Isar  #NoSQL  #Local Database',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 10,
            title: 'SharedPreferences\nFlutter Secure Storage 로컬 캐싱',
            tags: '#SharedPreferences  #SecureStorage  #Local Cache',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 11,
            title: 'MemoryCache\nDio Cache Interceptor - 메모리 및 네트워크 캐싱',
            tags: '#MemoryCache  #Dio  #Network Cache',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 12,
            title: '네이버 로그인',
            tags: '#Naver  #Login  #OAuth  #Social Login',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 13,
            title: '카카오 로그인',
            tags: '#Kakao  #Login  #OAuth  #Social Login',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 14,
            title: '화면 전환 (네비게이터)',
            tags: '#Navigator  #Routing  #Screen Transition',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 15,
            title: 'Flutter 밑줄 선 (한글에서 안깨지는 방법)',
            tags: '#Underline  #Korean  #Text Decoration',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 16,
            title: '배경화면 블러처리, 패딩 제거',
            tags: '#Blur  #Background  #Padding  #UI',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 17,
            title: '네트워크 이미지 사용방법 (심화 x, 기초)',
            tags: '#Network Image  #HTTP  #Image Loading',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 18,
            title: '카카오 맵 사용방법',
            tags: '#Kakao Map  #Map  #Location  #API',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 19,
            title: '자동 스크롤 (글로벌키, 고정 스크롤)',
            tags: '#Auto Scroll  #GlobalKey  #ScrollController',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 20,
            title: '다이아로그 함수 (Page-view)',
            tags: '#Dialog  #PageView  #Modal  #Popup',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 21,
            title: '랜덤 함수',
            tags: '#Random  #Math  #Utilities',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 22,
            title: '부모 위젯 사이즈 설정(x) 자식이 따라가기',
            tags: '#Widget Size  #Parent Child  #Layout',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 23,
            title: '부모위젯 최소 자유 최대 x',
            tags: '#Constraints  #Min Max  #Flexible  #Layout',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 24,
            title: '서버와 연결 (쿠키, secure_storage, dio)',
            tags: '#Server  #Cookie  #Dio  #HTTP',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 25,
            title: 'Flutter 생명주기 정리',
            tags: '#Lifecycle  #StatefulWidget  #App Lifecycle',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 26,
            title: '안드로이드 Flutter 여러가지 문제',
            tags: '#Android  #Issues  #Troubleshooting',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 27,
            title: 'iOS 버전 충돌',
            tags: '#iOS  #Version Conflict  #Deployment',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 28,
            title: '서버 데이터 가공 연습',
            tags: '#Data Processing  #JSON  #API Response',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 29,
            title: '스크롤 관련',
            tags: '#Scroll  #ScrollView  #ScrollController',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 30,
            title: 'FutureBuilder',
            tags: '#FutureBuilder  #Async  #Future',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 31,
            title: '바텀 모달시트',
            tags: '#BottomSheet  #Modal  #showModalBottomSheet',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 32,
            title: '드롭다운 버튼',
            tags: '#DropdownButton  #Dropdown  #Selection',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 33,
            title: '날짜 변환',
            tags: '#DateTime  #DateFormat  #Date Conversion',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 34,
            title: '하이브 로컬 저장',
            tags: '#Hive  #Local Storage  #NoSQL',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 35,
            title: '다이나믹 아일랜드',
            tags: '#Dynamic Island  #iOS  #UI Feature',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 36,
            title: '아이콘 클릭 이벤트 애니메이션',
            tags: '#Icon Animation  #Click Event  #Animation',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 37,
            title: 'Flutter 화면 스크롤 감지',
            tags:
                '#Scroll Detection  #NotificationListener  #ScrollNotification',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 38,
            title: 'PopupMenuButton',
            tags: '#PopupMenuButton  #Menu  #Popup',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 39,
            title: 'CachedNetworkImage',
            tags: '#CachedNetworkImage  #Image Cache  #Network Image',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 40,
            title: 'dio 캐시 처리',
            tags: '#Dio  #Cache  #HTTP Cache  #Interceptor',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 41,
            title: '캘린더 라이브러리',
            tags: '#Calendar  #Date Picker  #Library',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 42,
            title: 'NaverMap with Flutter',
            tags: '#Naver Map  #Map Widget  #Location',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 43,
            title: '바텀 네비게이션 바 (구글)',
            tags: '#BottomNavigationBar  #Navigation  #Google Style',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 44,
            title: '물결 애니메이션',
            tags: '#Wave Animation  #Custom Animation  #Ripple',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 45,
            title: '그라디언트',
            tags: '#Gradient  #LinearGradient  #RadialGradient',
          ),
          SizedBox(height: 40.h),
          MobileTechPostTitle(
            number: 46,
            title: '⭐ 반짝이는 별 애니메이션 구현 기록',
            tags: '#Star Animation  #Sparkle  #Custom Animation',
          ),
        ],
      ),
    );
  }
}
