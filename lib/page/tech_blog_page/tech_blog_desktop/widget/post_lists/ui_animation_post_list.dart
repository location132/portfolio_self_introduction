import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_post_title.dart';

class UIAnimationPostList extends StatelessWidget {
  const UIAnimationPostList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TechPostTitle(
          number: 22,
          title: '화면 전환 (네비게이터)',
          tags: '#Navigator  #Routing  #Screen Transition',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 23,
          title: '자동 스크롤 (글로벌키, 고정 스크롤)',
          tags: '#Auto Scroll  #GlobalKey  #ScrollController',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 24,
          title: '스크롤 관련',
          tags: '#Scroll  #ScrollView  #ScrollController',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 25,
          title: 'Flutter 밑줄 선 (한글에서 안깨지는 방법)',
          tags: '#Underline  #Korean  #Text Decoration',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 26,
          title: '배경화면 블러처리, 패딩 제거',
          tags: '#Blur  #Background  #Padding  #UI',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 27,
          title: '다이아로그 함수 (Page-view)',
          tags: '#Dialog  #PageView  #Modal  #Popup',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 28,
          title: '바텀 모달시트',
          tags: '#BottomSheet  #Modal  #showModalBottomSheet',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 29,
          title: '드롭다운 버튼',
          tags: '#DropdownButton  #Dropdown  #Selection',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 30,
          title: 'PopupMenuButton',
          tags: '#PopupMenuButton  #Menu  #Popup',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 31,
          title: '바텀 네비게이션 바 (구글)',
          tags: '#BottomNavigationBar  #Navigation  #Google Style',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 32,
          title: '캘린더 라이브러리',
          tags: '#Calendar  #Date Picker  #Library',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 33,
          title: '날짜 변환',
          tags: '#DateTime  #DateFormat  #Date Conversion',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 34,
          title: '랜덤 함수',
          tags: '#Random  #Math  #Utilities',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 35,
          title: '부모 위젯 사이즈 설정(x) 자식이 따라가기',
          tags: '#Widget Size  #Parent Child  #Layout',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 36,
          title: '부모위젯 최소 자유 최대 x',
          tags: '#Constraints  #Min Max  #Flexible  #Layout',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 37,
          title: '아이콘 클릭 이벤트 애니메이션',
          tags: '#Icon Animation  #Click Event  #Animation',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 38,
          title: '물결 애니메이션',
          tags: '#Wave Animation  #Custom Animation  #Ripple',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 39,
          title: '그라디언트',
          tags: '#Gradient  #LinearGradient  #RadialGradient',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 40,
          title: '⭐ 반짝이는 별 애니메이션 구현 기록',
          tags: '#Star Animation  #Custom Animation  #Sparkle',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 41,
          title: 'CachedNetworkImage',
          tags: '#CachedNetworkImage  #Image Cache  #Network Image',
        ),
      ],
    );
  }
}
