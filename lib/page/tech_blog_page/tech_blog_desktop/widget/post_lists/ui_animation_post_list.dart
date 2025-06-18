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
          number: 1,
          title: '화면 전환 (네비게이터)',
          tags: '#Navigator  #Routing  #Screen Transition',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 2,
          title: '자동 스크롤 (글로벌키, 고정 스크롤)',
          tags: '#Auto Scroll  #GlobalKey  #ScrollController',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 3,
          title: '스크롤 관련',
          tags: '#Scroll  #ScrollView  #ScrollController',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 4,
          title: 'Flutter 밑줄 선 (한글에서 안깨지는 방법)',
          tags: '#Underline  #Korean  #Text Decoration',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 5,
          title: '배경화면 블러처리, 패딩 제거',
          tags: '#Blur  #Background  #Padding  #UI',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 6,
          title: '다이아로그 함수 (Page-view)',
          tags: '#Dialog  #PageView  #Modal  #Popup',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 7,
          title: '바텀 모달시트',
          tags: '#BottomSheet  #Modal  #showModalBottomSheet',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 8,
          title: '드롭다운 버튼',
          tags: '#DropdownButton  #Dropdown  #Selection',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 9,
          title: 'PopupMenuButton',
          tags: '#PopupMenuButton  #Menu  #Popup',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 10,
          title: '바텀 네비게이션 바 (구글)',
          tags: '#BottomNavigationBar  #Navigation  #Google Style',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 11,
          title: '캘린더 라이브러리',
          tags: '#Calendar  #Date Picker  #Library',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 12,
          title: '날짜 변환',
          tags: '#DateTime  #DateFormat  #Date Conversion',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 13,
          title: '랜덤 함수',
          tags: '#Random  #Math  #Utilities',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 14,
          title: '부모 위젯 사이즈 설정(x) 자식이 따라가기',
          tags: '#Widget Size  #Parent Child  #Layout',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 15,
          title: '부모위젯 최소 자유 최대 x',
          tags: '#Constraints  #Min Max  #Flexible  #Layout',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 16,
          title: '아이콘 클릭 이벤트 애니메이션',
          tags: '#Icon Animation  #Click Event  #Animation',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 17,
          title: '물결 애니메이션',
          tags: '#Wave Animation  #Custom Animation  #Ripple',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 18,
          title: '그라디언트',
          tags: '#Gradient  #LinearGradient  #RadialGradient',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 19,
          title: '⭐ 반짝이는 별 애니메이션 구현 기록',
          tags: '#Star Animation  #Custom Animation  #Sparkle',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 20,
          title: 'CachedNetworkImage',
          tags: '#CachedNetworkImage  #Image Cache  #Network Image',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 21,
          title: '다이나믹 아일랜드',
          tags: '#Dynamic Island  #iOS  #UI Feature',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 22,
          title: 'Flutter 화면 스크롤 감지',
          tags: '#Scroll Detection  #NotificationListener  #ScrollNotification',
        ),
      ],
    );
  }
}
