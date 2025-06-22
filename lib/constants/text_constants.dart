//Text 파일을 모아두는 곳입니다.

class TextConstants {
  static const String welcomeMessage1 =
      '\n          안녕하세요 Flutter 개발자 이정원 입니다.          \n2025년 포트폴리오는 Rive 애니메이션을 활용해, 지금까지 공부한 내용을 담아 제작해 보았습니다.';
  static const String welcomeMessage2 =
      '\n          MVVM패턴, 클린아키텍쳐, get it을 사용한 DI, 애니메이션, 등          \n          다양한 것을 활용할 수 있는 인재가 되도록 노력하겠습니다.          ';

  static const String topNavBar1 = '자기소개서';
  static const String topNavBar2 = '프로젝트';
  static const String topNavBar3 = '기술 블로그';
  static const String topNavBar4 = '업데이트 될 내용';
  static const String topNavBar5 = '웹 제작 History';
  static const String topNavBar6 = '나만의 개발 팁';
  static const String topNavBar7 = '교육 및 강의';
}

class ProjectTextConstants {
  // 프로젝트 카테고리 제목
  static const String flutterTitle = 'Flutter';
  static const String flutterRiveTitle = 'Flutter in Rive';
  static const String futureProjectTitle = '앞으로 진행할 프로젝트';

  // 프로젝트 카테고리 설명
  static const String flutterDescription = 'Flutter를 사용해 만든 모든 프로젝트를 소개합니다.';
  static const String flutterRiveDescription =
      '실제로 직접 만들어 넣은 Rive 애니메이션을 소개합니다.';
  static const String futureProjectDescription =
      '새로운 도전을 준비하고 있습니다. 목표와 언제 시작할지 정해두었습니다.';

  // 프로젝트 개수
  static const String flutterProjectCount = '6개의 프로젝트';
  static const String flutterRiveProjectCount = '3개의 프로젝트';
  static const String futureProjectCount = '3개의 계획';

  // 프로젝트 상세 제목
  static const String flutterDetailTitle = 'Flutter 프로젝트';
  static const String flutterRiveDetailTitle = 'Flutter & Rive 프로젝트';
  static const String futureProjectDetailTitle = '앞으로 진행할 프로젝트';

  // 카테고리별 설명
  static const String allCategoryTitle = '모든 프로젝트';
  static const String allCategoryDescription =
      'Flutter 프레임워크와 Rive 애니메이션을 활용한 다양한 프로젝트들을 소개합니다. 각 프로젝트마다 다른 아키텍처와 기술 스택을 적용하여 경험을 쌓았습니다.';
  static const String flutterCategoryDescription =
      'Flutter를 사용해 만든 모든 프로젝트들을 소개합니다. MVVM 아키텍처부터 Clean Architecture까지, 다양한 규모의 프로젝트들을 경험했습니다.';
  static const String flutterRiveCategoryDescription =
      'Flutter in Rive로 만든 정교한 애니메이션 프로젝트들을 소개합니다. 마우스 호버와 클릭 상호작용부터 복잡한 상태 관리까지 구현했습니다.';
  static const String futureCategoryDescription =
      '앞으로 진행할 프로젝트들은 저와 주변 사람들이 원하는 프로젝트를 계획하고 있습니다.';

  static const String flutterContainerCount = '4개의 App 프로젝트';
  static const String flutterContainerCount2 = '2개의 웹 프로젝트';
  static const String flutterContainerCount3 = '2개의 선배 개발자 따라잡기 프로젝트';
  static const String flutterRiveContainerCount = '3개의 Rive 프로젝트';

  static const String comingSoonBadge = '곧 시작!';

  static const List<Map<String, String>> flutterProjects = [
    {
      'title': '잎사이',
      'description':
          '50688 줄의 코드 규모에 MVVM 아키텍처를 적용하고, TestFlight를 통해 협업한 프로젝트입니다.',
      'tech': 'MVVM, Clean Architecture, TestFlight',
    },
    {
      'title': 'NaverMap',
      'description':
          'Service 계층, Isar(Local DB), DIO 등, Clean Architecture를 적용하여 설계한 지도 기반 Flutter 프로젝트입니다.',
      'tech': 'Service_계층, Isar, DIO, NaverMap',
    },
    {
      'title': '클랭(KLANG)',
      'description': 'PM 역할을 수행하며 16명의 다양한 전공 팀원들과 함께한 협업 프로젝트입니다.',
      'tech': 'PM, Flutter, 비개발자 팀원과의 협업',
    },
    {
      'title': '구름 x 카카오 x 인프런',
      'description': '웹, 앱, 서버를 함께 공부하는 학생들이 협업하여 만든 게시판 형태의 프로젝트입니다.',
      'tech': '부트캠프, Collaboration, Service Planning',
    },
  ];

  // Flutter in Rive 프로젝트 데이터
  static const List<Map<String, String>> flutterRiveProjects = [
    {
      'title': 'About Me - With myDream',
      'description': '사용자의 마우스 호버에 반응해 원하는 챕터로 이동할 수 있도록 만든 첫 Rive 프로젝트입니다.',
      'tech': 'Pick - 첫 Rive 프로젝트',
    },
    {
      'title': 'MySkill - in Web',
      'description': '총 4일간 제작한 가장 긴 애니메이션으로, 초기 진입부터 부드러운 화면 전환이 이어집니다.',
      'tech': 'Pick - 32개의 리스너, 16개의 포인터, 4개의 트리거',
    },
    {
      'title': 'Detail Me',
      'description': '빈 화면에서 핸드폰이 나타나고, 사용자가 원하는 구성으로 내용을 꾸밀 수 있도록 설계된 구조입니다.',
      'tech': 'Pick - 다양한 연출에 쉽게 변형 가능한 범용적인 애니메이션',
    },
  ];

  // 미래 프로젝트 데이터
  static const List<Map<String, String>> futureProjects = [
    {
      'title': '악보 넘기기',
      'description':
          '동생이 음악을 전공하며 2025년 대학생이 되었고, 손을 사용하지 않고도 악보를 넘길 수 있는 악보 뷰어 앱을 만들 계획입니다.',
      'tech': '25년 7월 작업 시작 예정',
    },
    {
      'title': 'CCTV View',
      'description':
          '2025년 원주에서 시작한 작은 텃밭을 실시간으로 확인하고, 원격으로 물을 줄 수 있는 어플리케이션을 백엔드 개발자인 여자친구와 함께 개발할 예정입니다.',
      'tech': '25년 11월 작업 시작 예정',
    },
    {
      'title': '맞춤 건강 알림',
      'description': '복용 중인 약과 복용 시간을 기록하고, 필요한 약을 미리 알려주는 건강 도우미 앱을 만들 계획입니다.',
      'tech': '26년 백엔드를 배우며 작업시작 예정',
    },
  ];

  // 공통 텍스트
  static const String backToProjectList = '프로젝트 목록으로 돌아가기';
  static const String dividerText =
      '아래는 실제 출시된 앱을 분석하고 개선 아이디어를 반영해보는 실전 리디자인 프로젝트입니다.';
  static const String projectDetailPlayerText = '프로젝트 목록으로 돌아가기';
}

class IntroTextConstants {
  static const String introText1 = '2025';
  static const String introText2 = 'PORTFOLIO';
  static const String introText3 = 'FLUTTER-이정원';
}

class ProfileCardTextConstants {
  static const String profileCardName = '이정원';
  static const String profileCardEngName = 'Lee Jungwon';
  static const String profileCardBirth = '1998.01.03';
  static const String profileCardPhone = '010-7484-0692';
  static const String profileCardEmail = 'piano23010@gmail.com';
}

class ProfilePage1Constants {
  static const String retrospect0 =
      '지금 보여지는 Who Am I\n\n   - 이 페이지의 코드는 세세한 디테일 뿐 아니라 정교하게 이루어진 MVVM 패턴을 확인할 수 있습니다.\n         4개의 모델, 6개의 뷰, 그리고 @postConstruct어노테이션 등, 저를 가장 잘 표현하는 코드입니다.';
  static const String retrospect1 =
      'Q: 재미있는 사실 알고 계셨나요?\n\n   - A : 현재 보고 계신 화면에서 위아래 공간을 정확하게 잘라내기 위해,\n           DI주입 후 실행되는 @postConstruct 어노테이션을 사용하여 서비스파일에서 작업을 했습니다.';
  static const String retrospect2 =
      '사용자의 눈길이 가지않는 이곳 check\n\n   -point: 저의 장점은 아주 작은 미세한 부분이라도 관심을 가지며, 부족함을 채우기 위해 노력하는 것입니다.';
  static const String title = '지금의 저를 만들어준\n 소중한 시간들을 소개합니다.';
  static const String chapter1 = 'Chapter 1';
  static const String chapter1Title = '다양한 컨퍼런스와 세미나 참여';
  static const String chapter2 = 'Chapter 2';
  static const String chapter2Title = '경험이 풍부했던 대학생활';
  static const String chapter3 = 'Chapter 3';
  static const String chapter3Title = '진행중인 나의 이야기';
  static const String scroll = '스크롤을 따라 다양한 이야기가 소개됩니다.';

  static const String chapter1Mobile =
      ' 세미나에 참여하는 이유 그리고 되고싶은\n개발자의 모습을 확인할 수 있습니다.';
  static const String chapter2Mobile =
      ' 대학생활의 프로젝트와, 인턴 경험..\n성장을 위한 소중한 시간들을 소개합니다.';
  static const String chapter3Mobile =
      ' 아직 끝나지 않은 과감한 성장기 그리고 목표,\n더 나은 개발자로 성장하기 위한 저를 소개합니다.';
}

class TitleTextConstants {
  static const String title1 = 'About Me.';
  static const String subTitle1 = '짧지만 깊게';
  static const String description1 = ' 나를 담은 소개 애니메이션';

  static const String title2 = 'Who Am I.';
  static const String subTitle2 = '나를 소개하는';
  static const String description2 = '과거의 기록, 그리고 진행중인 이야기';

  static const String title3 = 'Flutter.';
  static const String subTitle3 = '와 어울리는';
  static const String description3 = ' 이런 기술들을 사용해요';

  // 스킬 섹션 제목들
  static const List<Map<String, String>> skillTitles = [
    {'title': 'Flutter.', 'subTitle': '와 어울리는', 'description': ' 이런 기술들을 사용해요'},
    {
      'title': 'Skill.',
      'subTitle': ' 그래서 만들었어요',
      'description': ' 개발자 이정원 스타일로',
    },
  ];

  // 챕터 섹션 제목들
  static const List<Map<String, String>> chapterTitles = [
    {'title': 'Flutter', 'subTitle': ' 신입은 역시,', 'description': ' 이정원'},
    {'title': '알면,', 'subTitle': ' 알수록', 'description': ' 이정원'},
  ];

  // FAQ 섹션 제목들
  static const List<Map<String, String>> faqTitles = [
    {'title': '마지막까지 완벽하게', 'subTitle': ' 신입은 역시,', 'description': ' ???'},
    {'title': '마지막까지 완벽하게', 'subTitle': ' 신입은 역시,', 'description': ' 이정원'},
  ];

  // 프로젝트 기술 스택 데이터
  static const Map<String, dynamic> projectTechStackData = {
    'imagePath': 'assets/Images/ifsai_img/web_project_3.png',
    'imageDescription': '아래의 기술은 잎사이 프로젝트에 적용된 기술입니다!',
    'title': '다양한 기술로\n완성도 높은 앱을 만들어요',
    'techStacks': [
      {
        'title': '인증 & 보안',
        'items': [
          'OAuth 2.0 기반 로그인',
          'Google / Kakao / Naver\n소셜 로그인',
          'JWT Token 처리',
          'Flutter Jailbreak Detection',
          'Flutter Secure Storage',
        ],
      },
      {
        'title': '네트워크 & API',
        'items': [
          'Dio - 커스텀 HTTP 클라이언트',
          'Dio Interceptor',
          'Cache Interceptor',
          'Build Runner - 모델 자동 생성',
        ],
      },
      {
        'title': 'UI/UX & 애니메이션',
        'items': [
          'Rive Animation - 커스텀 인터랙션',
          'TweenAnimationBuilder',
          '기본 애니메이션',
          'Shimmer - 로딩 스켈레톤',
          'Custom Refresh Indicator',
          'CachedNetworkImage',
          'ImagePicker',
        ],
      },
      {
        'title': '기타 기능',
        'items': [
          'URL Launcher - 외부 링크',
          'Flutter Compass - 나침반 기능',
          'Flutter Dotenv - 환경변수 관리',
          'Cookie Manager',
        ],
      },
      {
        'title': '위치 & 지도',
        'items': ['Naver Map', 'Kakao Map', 'Geolocator', 'Permission Handler'],
      },
    ],
  };

  // FAQ 데이터
  static const List<Map<String, String>> faqData = [
    {
      'question': '깃 허브 주소가 있나요?',
      'answer':
          '잎 사이 프로젝트의 깃 허브 주소는 https://github.com/location132/IFSAI 입니다.\n\n 위 레포지토리에는 모든 것이 올라간 것이 아니며,\n모든 파일이 올라가는 곳은 서버와 연결이 되어있어 따로 공개하겠습니다.',
    },
    {
      'question': '프로젝트는 배포를 아직 못한건가요?',
      'answer':
          '배포를 너무나 간절하게 희망했지만 실력이 아직 부족하다 생각해 배포까지 진행을 못하였습니다.\n하지만 TestFlight를 사용해 디자이너와 백엔드 개발자와 협업하고 테스트를 진행하였습니다.',
    },
    {
      'question': '서비스 파일을 보여주실 수 있나요?',
      'answer':
          '서비스 파일은 제 실력, 그리고 회사에서도 중요한 자산이라 생각해 쉽게 공개를 하지 못하였습니다.\n하지만 취업 후 제가 만든 서비스 파일을 피드백 삼아 더욱 발전하고싶습니다.',
    },
    {
      'question': '5만806줄이나 작성하셨는데 컴포넌트 재활용을 못한건가요?',
      'answer':
          '컴포넌트 재활용을 하기 위해 매일 만든 것을 다시 뒤엎어가며 코드를 작성하였습니다.\n하지만, 하루하루 코드를 보며 아직까지도 제 코드를 봐도 만족스럽지 않습니다.\n앞으로 더욱 노력해 클린한 코드를 만들고자 저 자신과 약속합니다.',
    },
    {
      'question': '프로젝트의 UI를 보여주실 수 있나요?',
      'answer': '디자이너와 협업한 피그마와 제플린 링크를 확인해주세요',
    },
    {
      'question': '상태관리를 2개나 사용하신 이유가 있나요?',
      'answer':
          '아니요.. 처음부터 이렇게 대규모 프로젝트였다면 bloc 또는 cubit패턴을 활용해 상태관리를 진행했을 것 같습니다.\n아직 리펙토링을 다 진행하지 못해.. 현재 2개의 상태관리를 활용하고 있습니다',
    },
    {
      'question': '이 프로젝트에서 가장 많이 고민한 지점은 무엇이었나요?',
      'answer':
          '저는 이 프로젝트 가능한 사용자에게 사용이 느리지 않은 불편한점이 없는 프로젝트를 만들고 싶었습니다.\n이 부분이 저에게 가장 큰 시간, 그리고 가장 큰 성장을 할 수 있게 만들어준 포인트라 생각합니다.',
    },
    {
      'question': '프로젝트에서 가장 후회되는 선택이 있다면?',
      'answer':
          '너무 크게 시작하는것이 아닌 MVP를 선정해 핵심 기능을 먼저 공개 후, 배포하지 못하고 졸업한 것이 너무나 큰 후회가 되었습니다.',
    },
    {
      'question': '팀원들과 의견이 맞지 않았던 부분이 있었나요?',
      'answer':
          '잎사이 프로젝트를 진행하며 팀원들과 의견이 맞지 않았던 부분은 없었습니다.\n팀원들과 함께 프로젝트를 진행하며 소통을 잘 하고 의견을 존중하는 팀원들이 있어 프로젝트를 잘 진행할 수 있었습니다.',
    },
  ];

  // 배너 섹션 제목들
  static const List<Map<String, String>> bannerTitles = [
    {
      'title': 'Intro.',
      'subTitle': ' 시작부터 다르게',
      'description': ' 이어지는 About Me.',
    },
    {
      'title': 'About Me.',
      'subTitle': ' 짧지만 깊게',
      'description': ' 나를 담은 소개 애니메이션',
    },
  ];
}

class EducationTextConstants {
  static const String educationTitle = 'EDUCATION';
  static const String profileCardEducation1 = '건국대학교 글로컬 캠퍼스\n(2025.02 졸업)';
  static const String profileCardEducation2 =
      'ICT 학점 연계 인턴쉽\n주식회사 Temps (2024.08 ~ 2024.12)';
  static const String profileCardEducation5 =
      '구름 x 카카오 부트캠프 수료\n구름 x 카카오 부트캠프 우수상 수상';
}

class ExperienceTextConstants {
  static const String experienceTitle = 'EXPERIENCE';
  static const String experience1 =
      'ICT 인턴 @ 주식회사 Temps\n - 관리자 웹페이지 개발\n - Baily 앱 버그 테스트 및 기능 개발';
  static const String experience2 =
      '구름 부트캠프 프로젝트 경험\n - 실무 중심 프로젝트 진행\n - 협업을 통한 개발 경험';
}

class ProjectsTextConstants {
  static const String projectsTitle = 'PROJECTS';
  static const String projects1 =
      '개인 프로젝트: \n - 개인 웹 페이지 \n - Rive 애니메이션\n - My_Diary(시각디자인 학생과 함꼐한 프로젝트) \n - 네이버 MAP';
  static const String projects2 =
      '팀 프로젝트: \n - 잎사이 프로젝트(Flutter, PM) \n - Klang 프로젝트(Flutter, PM)\n - 졸업작품 Koffee';
}

class SkillTextConstants {
  static const String title = '기술은 확실하게';
  static const String subTitle = '협업은 조화로운 시너지를 만들도록';
}

//Description
class DescriptionTextConstants {
  static const String descriptionTitle = 'DESCRIPTION';
  static const String description =
      '전달하고 싶은 내용, 그리고 디테일들\n\n'
      'Description은 모든 과정이 어떻게 만들어졌는지 확인할 수 있는 공간입니다.\n'
      '최대한 많은 아이디어를 담은 모든 부분을 소개하겠습니다.';
}

// About Me, DESCRIPTION
class BannerDescriptionConstants {
  static const Map<String, String> bannerDescriptions = {
    'About Me':
        '웹의 가장 처음은 Rive 애니메이션과 함께\n'
        '저만의 장점과 목표를 보여주고 새로운 툴의 도전을 구현해보고 싶었습니다.\n\n'
        '각 모션과 트리거 속에는\n'
        '제가 목표로해온 개발 방식과 생각이 자연스럽게 녹아들게 구성하였으며,\n'
        '지금까지 어떤 목표를 가지고 개발에 임해왔는지\n'
        '어디를 향해 나아가고 있는지에 관해 시각적 효과로 표현할 수 있도록 목표하였습니다.\n\n'
        '마우스를 올릴 때마다 부드럽게 반응하는 About Me 섹션은\n'
        '저의 장점과 강점을 자연스럽게 전달하기 위한 시도이며\n'
        '처음으로 시도해보는 도전을 보여줄 수 있는 저만의 작은 Rive 애니메이션입니다.',
    'Detail':
        '현재 보고 계신 Rive 애니메이션은 약 4일에 걸쳐 제작되었습니다.\n'
        '처음으로 Rive를 제작하는 도전은 많은 시간이 걸렸지만\n'
        'Rive에 관해 공부해 더 발전한 Flutter 개발자가 되었습니다.\n\n'
        '작은 모션 그리고 디테일한 움직임에도 부드러운 전환을 위해 조정을 반복하며\n'
        '13트리거와 6개의 컨트롤러를 활용해 자연스럽게 반응하도록 구현했습니다.\n\n'
        '여기서 끝나지 않고 저는 더 완벽한 애니메이션을 만들기 위해\n'
        '0.1초에서 0.3초까지 미세하게 속도를 다르게 설정해\n'
        '부드러운 선의 흐름과 템포를 만들기위해 설계하였습니다.\n\n'
        '이 설계를 통해 자칫 너무 많은 텍스트의 부담감을\n'
        '조금이라도 몰입할 수 있도록 구성하고자 노력했습니다.',
    'Process':
        '현재 노션에 있는 내용을 웹사이트 firebase로 옮겨\n'
        '작업을 진행중입니다.\n'
        '조금씩 완성되어 가는 모습을 기대해주세요.\n\n\n\n'
        'Rive 제작과정                         Flutter 제작과정',
  };

  static const List<String> menuItems = ['About Me', 'Detail', 'Process'];
}

class SelectTapTextConstants {
  static const String myStackTitle1 = '나의 중심 개발 기술';
  static const String myStack1 =
      '   Flutter Web,    Flutter Mobile,    Firebase\n'
      '      MVVM,    Clean Architecture Design,    get_it(DI)\n'
      '   build_runner watch,    SingleTon,    injectable';
  static const String selectTapTitle1 = ' 50688줄 넘는 코딩시간. ';
  static const String selectTapDescription1 =
      '회사와 성장하기에 너무좋은 코딩시간입니다.\n'
      '각종 시행작오가 있었던 과거의 시간들\n'
      '불가능이란 없고 뭐든지 할 수 있다는 마음을 가지게 해준 경험,\n\n';
  static const String selectTapFinalMessage1 = '이제 이 경험을 활용할 시간이 되었습니다.';

  static const String selectTapTitle2 = '흩어진 상태를 하나로. ';
  static const String selectTapDescription2 =
      '단순한 화면일수록 복잡한 흐름이\n숨겨져 있습니다.'
      ' 무엇이 어디서 변하고, 어떻게 이어지는지.\n'
      '상태를 이해하고 정리하는 힘,\n\n';
  static const String selectTapFinalMessage2 = '앱을 더 깊이 있게 만드는 시작이었습니다.';
  static const String myStackTitle2 = '저는 아래의 상태관리를 잘 사용합니다.';
  static const String myStack2 =
      '   Provider    /    Bloc    /    Cubit    /    setState\n';

  static const String selectTapTitle3 = '생명주기를 이해하는 힘. ';
  static const String selectTapDescription3 =
      'initState부터 dispose까지,\n'
      '위젯의 생명주기를 정확히 이해하고 활용합니다.\n'
      '작은 누수도 놓치지 않기 위한 메모리 관리,\n\n';
  static const String selectTapFinalMessage3 = '기본기를 지키는 것, 그것이 가장 강한 실력입니다.';
  static const String myStackTitle3 = 'Flutter는 흐름을 아는 사람을 좋아합니다';
  static const String myStack3 =
      '개발 중 자주 사용하는 생명주기\ninitState  /  dispose  /  didUpdateWidget  /  didChangeDependencies\n'
      '개발중 종종 사용하는 생명주기\nWidgetsBindingObserver 그리고 AppLifecycleState';

  static const String selectTapTitle4 = '생동감 있는 사용자 경험. ';
  static const String selectTapDescription4 =
      'Rive 애니메이션부터\n Flutter Animation까지,'
      '사용자의 눈을 사로잡는 인터랙션을 구현합니다.\n\n'
      '정적인 화면 전환이 아닌, 신경쓴 애니메이션\n';
  static const String selectTapFinalMessage4 = '어플리케이션을 더욱 생생하게 만드는 시작입니다';
  static const String myStackTitle4 = '저는 아래의 애니메이션 도구들을 능숙하게 다룹니다.';
  static const String myStack4 =
      '   Rive    /    Flutter Animation    /    Custom Animation\n         Canva    /    AI Studio\n';

  static const String selectTapTitle5 = '함께 만들어가는 가치.';
  static const String selectTapDescription5 =
      '같은 팀 개발자들과의 협업은 물론,\n'
      '디자이너, 기획자, 심지어 다른 팀과의 연결까지.\n\n'
      '역할을 나누고, 정보를 공유하고, 의견을 나누는 과정 속에서\n'
      '더 나은 방향과 결과를 만들어냅니다.\n\n';

  static const String selectTapFinalMessage5 = '팀을 넘어, 함께 만드는 경험이 진짜 성장입니다.';

  static const String myStackTitle5 = '아래의 협업 도구를 적극적으로 활용합니다.';
  static const String myStack5 =
      '   Git    /    GitHubDesktop    /    Figma    /    Notion    /    Slack\n';
}

abstract class CardConstants {
  static List<Map<String, String>> get items => [];
  static String get title => '';
  static String get subTitle => '';
  static String get highlight => '';
  static String get highlightDescription => '';
  static List<int> get starredIndexes => [];
}

class PatternTextConstants extends CardConstants {
  static const List<Map<String, String>> patterns = [
    {
      'title': 'Clean Architecture Pattern',
      'desc':
          'Cubit → Service → Repository → (API: RemoteSource → Dio → Response) 또는 (로컬: LocalSource → Isar) → Model → State → View',
    },
    {
      'title': 'DI Pattern',
      'desc':
          'get_it과 injectable 어노테이션을 통해 의존 객체를 자동 등록하여 전역에서 사용할 수 있도록 설계하고 있습니다.',
    },
    {
      'title': 'Cubit Pattern',
      'desc': 'View와 상태를 분리해 코드 가독성과 유지보수를 높입니다. 모든 프로젝트에 적용 중인 핵심 패턴입니다.',
    },
    {
      'title': 'MVVM Pattern',
      'desc':
          'View와 모델을 freezed로 분리해 테스트 용이하고 유지보수가 용이합니다. 모든 프로젝트에 적용 중인 핵심 패턴입니다.',
    },
    {
      'title': 'Singleton Pattern',
      'desc': '전역에서 한 인스턴스를 공유해 무결성을 유지해 사용하고 있습니다.',
    },
  ];

  static List<Map<String, String>> get items => patterns;
  static String get title => 'Pattern';
  static String get subTitle => '손에 익었어요!';
  static String get highlight => '  Highlight: ';
  static String get highlightDescription =>
      ' 프로젝트를 진행할 때\n   제가 가장 많이 사용하는 패턴을 소개합니다.';
  static List<int> get starredIndexes => [0, 1];
}

class StateManagementConstants extends CardConstants {
  static const List<Map<String, String>> _stateManagement = [
    {
      'title': 'BLoC/Cubit',
      'desc': '2번째 프로젝트부터 사용하기 시작하고 현재 주력이 된 Cubit 상태관리입니다. 가장 자신있는 상태관리입니다.',
    },
    {
      'title': 'Provider',
      'desc':
          '가장 처음 공부하고 채택한 상태관리입니다. 너무나 간편하지만,  5만줄이 넘는 제 코드에 적용하기엔 무리가 있었습니다.',
    },
    {'title': 'setState', 'desc': '못하면 플러터 간첩..ㅎ'},
  ];

  static List<Map<String, String>> get items => _stateManagement;
  static String get title => '상태관리';
  static String get subTitle => '자신있어요!';
  static String get highlight => '  Highlight: ';
  static String get highlightDescription =>
      ' 프로젝트 규모에 따라 적절한 패턴을\n   선택합니다.  5만줄이 넘는 잎사이에서는 무조건 Cubit!';
  static List<int> get starredIndexes => [0];
}

class LifecycleConstants extends CardConstants {
  static const List<Map<String, String>> _lifecycle = [
    {
      'title': '자신있는 생명주기',
      'desc':
          'initState  /  dispose  /  didUpdateWidget  /  didChangeDependencies',
    },
    {
      'title': '조금만 사용해본 생명주기',
      'desc': 'WidgetsBindingObserver\n그리고\nAppLifecycleState',
    },
    {
      'title': '한번도 사용안한 생명주기',
      'desc':
          'reassemble / deactivate / didHaveMemoryPressure 등 디버깅 및 시스템 이벤트용 생명주기',
    },
  ];

  static List<Map<String, String>> get items => _lifecycle;
  static String get title => '생명주기';
  static String get subTitle => '몇개만 자신있어요';
  static String get highlight => '  Highlight: ';
  static String get highlightDescription =>
      ' 생명주기를 정확히 이해하면\n   메모리 효율성과 성능을 크게 향상시킬 수 있습니다.';
  static List<int> get starredIndexes => [];
}

class AnimationConstants extends CardConstants {
  static const List<Map<String, String>> _animations = [
    {
      'title': 'Rive 애니메이션',
      'desc':
          'Rive를 활용해 간단한 애니메이션을 직접 만들고 있어요. 지금 보는 데스크탑 웹 그리고 Detail 페이지도 직접 만들었습니다.',
    },
    {
      'title': 'Flutter Animation',
      'desc':
          'AnimationController를 사용해 여러가지 인터렉션을 구현하고 적용하고 있습니다. 어렵지만 재미있게 제작하고 있어요',
    },
  ];

  static List<Map<String, String>> get items => _animations;
  static String get title => '애니메이션';
  static String get subTitle => '완벽하지는 않아요!';
  static String get highlight => '  Highlight: ';
  static String get highlightDescription =>
      ' 복잡한 애니메이션은 못하지만,\n    흥미를 끌 수 있는 애니메이션은 직접 만들고 있습니다.';
  static List<int> get starredIndexes => [];
}

class MainPageTextConstants {
  // 제목들
  static const String aboutMeTitle = '일단 핵심부터';
  static const String detailMeTitle = '더 자세히 살펴보기.';
  static const String projectSectionTitle = '더 강력한 개발자로 UP';
  static const String projectSectionSubTitle = '   신입 프로젝트를 더욱 멋지게';

  // 플레이어 텍스트
  static const String aboutMePlayerText = '화면을 옆으로 넘겨 다양한 이야기를 확인해보세요';
  static const String introPlayerText = '지금 바로 시작합니다.';
  static const String defaultPlayerText = '잠시만 기다려주세요.';
}

class TerminalTextConstants {
  static const String terminalTitle = '명확한 책임 분리\n파일구조부터 차별화할 수 있도록';
  static const String clipboardTitle = '명령어 클립보드';
  static const String terminalHeader = 'Terminal';
  static const String copyButtonText = '복사';
  static const String executeButtonText = '붙여넣기 & 실행';
  static const String executingText = '실행 중...';
  static const String copySuccessMessage = '복사 완료';
  static const String terminalPrompt =
      'jung_won@Lee-Jungwon-MacBookAir IFSAI-Flutter % ';
  static const String commandExecutedMessage = 'Command executed successfully.';
  static const String invalidCommandMessage = '위 클립보드에서 복사 가능한 명령어만 입력해주세요';

  static const List<Map<String, String>> clipboardCommands = [
    {
      'title': '총 코드 라인 수',
      'command': 'find lib -name "*.dart" | wc -l',
      'description': '전체 라인수를 소개하겠습니다.',
    },
    {
      'title': '코드 라인 수 계산',
      'command': 'find lib -name "*.dart" | xargs wc -l',
      'description': '파일과 코드 라인 수를 소개하겠습니다.',
    },
    {
      'title': '프로젝트 구조',
      'command': 'tree lib',
      'description': '트리형태로 저의 파일을 소개하겠습니다.',
    },
  ];

  static const String totalLinesOutput = '50688';
  static const String treeLibOutput = '''lib
├── coreService
│   ├── bloc
│   │   └── page_navigation
│   │       ├── page_bloc.dart
│   │       ├── page_event.dart
│   │       └── page_state.dart
│   ├── core
│   │   ├── di
│   │   │   ├── injector.config.dart
│   │   │   └── injector.dart
│   │   ├── dio
│   │   │   ├── dio_core.dart
│   │   │   └── dio_interceptor_cache.dart
│   │   ├── permission
│   │   │   └── permission_handler.dart
│   │   ├── service
│   │   │   └── location_service.dart
│   │   └── utils
│   │       ├── image_url_helper.dart
│   │       ├── responsive_size.dart
│   │       ├── scroll_controller_mixin.dart
│   │       └── verifty_form.dart
│   ├── Dialog
│   │   ├── locationPermissionDialog.dart
│   │   ├── login_dialog.dart
│   │   ├── my_page_event_end_dialog.dart
│   │   ├── my_page_orderlist_delete_dialog.dart
│   │   ├── my_page_review_delete_dialog.dart
│   │   ├── myCart_dialog.dart
│   │   ├── partnership_request_delete_diaglog.dart
│   │   ├── partnership_request_email_different_dialog.dart
│   │   ├── partnership_request_save_dialog.dart
│   │   └── start_service_maintenance_notice.dart
│   ├── isar
│   │   ├── app_version
│   │   │   ├── app_version_service.dart
│   │   │   └── data
│   │   │       ├── version.dart
│   │   │       └── version.g.dart
│   │   ├── isar_init_service.dart
│   │   └── naver_map
│   │       ├── data
│   │       │   ├── naver_map_category.dart
│   │       │   ├── naver_map_category.g.dart
│   │       │   ├── naver_map_data.dart
│   │       │   ├── naver_map_data.g.dart
│   │       │   ├── naver_map_version.dart
│   │       │   └── naver_map_version.g.dart
│   │       ├── naver_map_category_service.dart
│   │       ├── naver_map_data_service.dart
│   │       └── naver_map_version_service.dart
│   ├── kakao_api_service.dart
│   ├── provider.dart
│   ├── routes.dart
│   ├── Sharedpreferences.dart
│   ├── Shimmer_loading
│   │   ├── loding_gif_IFSAI.dart
│   │   └── main_shimmer.dart
│   ├── theme.dart
│   └── widget
│       ├── banner.dart
│       ├── bottom_navigation.dart
│       ├── custom_appbar.dart
│       ├── \\010ifsai_button_components
│       │   └── wide_green_button.dart
│       ├── mypage_filter_button.dart
│       ├── paginationIndicator.dart
│       ├── searchbar.dart
│       ├── store_components
│       │   ├── store_info_summary.dart
│       │   ├── store_menu_category_detail.dart
│       │   ├── store_menu_category.dart
│       │   ├── store_quantity_controller.dart
│       │   └── store_rating_summary.dart
│       └── store_container.dart
├── main.dart
├── model
│   ├── affiliated_store.dart
│   ├── affiliated_store.freezed.dart
│   ├── cart.dart
│   ├── cart.freezed.dart
│   ├── ifsai.dart
│   ├── ifsai.freezed.dart
│   ├── location.dart
│   ├── location.freezed.dart
│   ├── market.dart
│   ├── market.freezed.dart
│   ├── menus_option.dart
│   └── menus_option.freezed.dart
├── Page
│   ├── 1_start_page
│   │   ├── page
│   │   │   ├── start_cubit.dart
│   │   │   ├── start_page.dart
│   │   │   ├── start_state.dart
│   │   │   └── start_state.freezed.dart
│   │   └── \\010service
│   │       └── start_reomte_service.dart
│   ├── 10_my_page
│   │   ├── 10_my_page.dart
│   │   ├── 10.1_my_page_notice.dart
│   │   ├── 10.10_my_page_review_write_comp.dart
│   │   ├── 10.11_my_page_review_write_back.dart
│   │   ├── 10.12_my_page_review_fix_back.dart
│   │   ├── 10.13_my_page_review_detail.dart
│   │   ├── 10.14_my_page_myinfo.dart
│   │   ├── 10.14.1_my_page_myinfo_viewmode.dart
│   │   ├── 10.14.2_my_page_myinfo_editmode.dart
│   │   ├── 10.15_my_page_setting.dart
│   │   ├── 10.2_my_page_notice_detail.dart
│   │   ├── 10.3_my_page_event.dart
│   │   ├── 10.4_my_page_event_detail.dart
│   │   ├── 10.5_my_coupon.dart
│   │   ├── 10.6_my_wishlist.dart
│   │   ├── 10.7_my_page_orderlist.dart
│   │   ├── 10.8_my_page_orderlist_detail.dart
│   │   ├── 10.9_my_page_review.dart
│   │   ├── 10.9.1_my_page_review_write_list.dart
│   │   ├── 10.9.2_my_page_review_already_write_list.dart
│   │   └── my_page_dio
│   │       └── my_page_dio.dart
│   ├── 11_shopping_cart
│   │   ├── core
│   │   │   ├── shopping_cart_dio
│   │   │   │   └── my_shopping_cart_dio.dart
│   │   │   └── shopping_cart_provider
│   │   │       └── my_shopping_cart_state.dart
│   │   └── pages
│   │       ├── shopping_option_page
│   │       │   ├── shopping_option_cubit.dart
│   │       │   ├── shopping_option_page.dart
│   │       │   ├── shopping_option_state.dart
│   │       │   ├── shopping_option_state.freezed.dart
│   │       │   └── widget
│   │       │       └── shopping_Item_detail_card.dart
│   │       └── shopping_page
│   │           ├── shopping_cart_cubit.dart
│   │           ├── shopping_cart_page.dart
│   │           ├── shopping_cart_state.dart
│   │           ├── shopping_cart_state.freezed.dart
│   │           └── widget
│   │               ├── 11.1_my_shopping_cart_storelistview.dart
│   │               ├── 11.2_my_shopping_cart_menulistview.dart
│   │               └── recommended_side_menu.dart
│   ├── 12_naver_map
│   │   ├── dio
│   │   │   └── naver_map_dio.dart
│   │   ├── page
│   │   │   ├── bottom_sheet
│   │   │   │   ├── bottom_panel.dart
│   │   │   │   └── widget
│   │   │   │       ├── long_panel.dart
│   │   │   │       └── short_panel.dart
│   │   │   ├── NaverMapApp_cubit.dart
│   │   │   ├── NaverMapApp_page.dart
│   │   │   ├── NaverMapApp_state.dart
│   │   │   ├── NaverMapApp_state.freezed.dart
│   │   │   └── widget
│   │   │       ├── current_location_button.dart
│   │   │       ├── market_widget.dart
│   │   │       ├── naver_map_widget.dart
│   │   │       ├── search_category_section.dart
│   │   │       └── top_category.dart
│   │   └── service
│   │       ├── naver_map_overlay.dart
│   │       └── naver_map_service.dart
│   ├── 13_join_us
│   │   ├── 13.1_join_us_detail_page.dart
│   │   ├── 13.1.2_join_us_detail_comment.dart
│   │   └── 13.2_join_us_request_page.dart
│   ├── 14_affiliated_store
│   │   ├── dio
│   │   │   └── affiliated_dio.dart
│   │   └── pages
│   │       ├── affiliated_detail_page
│   │       └── affiliated_page
│   │           ├── affiliated_store_cubit.dart
│   │           ├── affiliated_store_page.dart
│   │           ├── affiliated_store_state.dart
│   │           ├── affiliated_store_state.freezed.dart
│   │           └── widgets
│   │               └── store_container.dart
│   ├── 15_invite_page
│   │   ├── 15.1_invite_detail_page.dart
│   │   └── 15.2_invite_container.dart
│   ├── 2_login_page
│   │   ├── 2_login.dart
│   │   ├── 2.1_login_error.dart
│   │   ├── login_dio
│   │   │   └── login_dio.dart
│   │   └── snsLogin
│   │       ├── apple_login.dart
│   │       ├── google_login.dart
│   │       ├── kakao_login.dart
│   │       └── naver_login.dart
│   ├── 3_student_email_page
│   │   ├── 3_student_identity_detail.dart
│   │   ├── 3.1_student_email.dart
│   │   ├── 3.2_student_email_check.dart
│   │   ├── 3.3_error_dialog.dart
│   │   ├── 3.4_success_dialog.dart
│   │   ├── 3.5_email_error_dialog.dart
│   │   ├── 3.6_students_success_screen.dart
│   │   ├── 3.7_loginChageToSns
│   │   │   ├── 3.7.1_students_snstoggle_naver.dart
│   │   │   └── 3.7.2_students_snstoggle_kakao.dart
│   │   └── 3.7_student_account_transfer_dialog.dart
│   ├── 4_main_page
│   │   ├── 4_main_screen.dart
│   │   ├── 4.0_main_page.dart
│   │   ├── 4.1_main_logo_searchbar.dart
│   │   ├── 4.10_main_quest.dart
│   │   ├── 4.10.1_main_quest_guest.dart
│   │   ├── 4.11_join_us.dart
│   │   ├── 4.2_main_adBanner.dart
│   │   ├── 4.3_main_category.dart
│   │   ├── 4.4_main_top12.dart
│   │   ├── 4.4.1_main_top_12_container.dart
│   │   ├── 4.5_main_new_store.dart
│   │   ├── 4.6_main_best_review.dart
│   │   ├── 4.6.1_main_best_review_contauner.dart
│   │   ├── 4.7_main_hot_promotion.dart
│   │   ├── 4.9_main_tourist_attractions.dart
│   │   ├── 4.9.1_main_tourist_container.dart
│   │   ├── components
│   │   │   ├── main_Add_banner.dart
│   │   │   ├── main_container.dart
│   │   │   ├── main_SmoothPageIndicator.dart
│   │   │   └── main_title_overview.dart
│   │   ├── main_detail_page
│   │   │   ├── 0_detail_join_us.dart
│   │   │   ├── 1_detail_new_store.dart
│   │   │   ├── 2_detail_top_12.dart
│   │   │   ├── 3.1_detail_category_attraction.dart
│   │   │   ├── 3.2_detail_category_eating.dart
│   │   │   ├── 3.2_FoodAndBeveragePage
│   │   │   │   └── service
│   │   │   ├── 4_detail_quest.dart
│   │   │   └── 5_detail_all_quest.dart
│   │   └── main_dio
│   │       └── main_screen_dio.dart
│   ├── 5_search_page
│   │   ├── 5.1.1_searcscreen.dart
│   │   ├── 5.2_search_logic.dart
│   │   ├── 5.2.1_search_logic_history.dart
│   │   ├── 5.2.2_search_logic_keywords.dart
│   │   ├── 5.2.3_search_logic_category.dart
│   │   ├── 5.2.4_search_logic_trending.dart
│   │   └── search_dio
│   │       └── search_screen_dio.dart
│   ├── 6_search_results_page
│   │   ├── 6_search_results_screen.dart
│   │   └── search_result_dio
│   │       └── search_screen_dio.dart
│   ├── 7_partnership_request_page
│   │   ├── 0.partnership_dio
│   │   │   └── partnership_screen_dio.dart
│   │   ├── 1.partnership_mainPage
│   │   │   ├── 7.1_partnership_request_screen.dart
│   │   │   ├── 7.1.1._partnership_request_category.dart
│   │   │   └── 7.1.2_partnership_request_customContainerBoard.dart
│   │   ├── 2.partnership_formpage
│   │   │   ├── 7.2_partnership_request_form.dart
│   │   │   ├── 7.2.1_partnership_request_form_textfield.dart
│   │   │   └── 7.2.2_partnership_request_form_button.dart
│   │   ├── 3.partnership_formpage_detail
│   │   │   ├── 7.3_partnership_search.dart
│   │   │   ├── 7.3.1_partnership_searchScreen.dart
│   │   │   └── 7.3.2_partnership_kakaoMap.dart
│   │   ├── 4.partnership_detail_page
│   │   │   ├── 7.4_partnership_detail_page.dart
│   │   │   ├── 7.4.1_parthership_detail_comment.dart
│   │   │   ├── 7.4.2_partnership_detail_title.dart
│   │   │   └── 7.4.3_partnership_detail_userinfo.dart
│   │   └── 7.5_parthership_request_change_form.dart
│   ├── 8_detail_store
│   │   ├── 8_detail_store.dart
│   │   ├── 8.1_detail_store_title.dart
│   │   ├── 8.2_detail_store_notice.dart
│   │   ├── 8.3_detail_store_event.dart
│   │   ├── 8.4_detail_store_appbarcategory.dart
│   │   ├── 8.4.1_detail_store_appbarcategory_Icon.dart
│   │   ├── 8.6_detail_coupons.dart
│   │   ├── detail_store_dio
│   │   │   └── detail_dio.dart
│   │   └── menu_option
│   │       ├── bottomSheet_menu_cubit.dart
│   │       ├── bottomSheet_menu_page.dart
│   │       ├── bottomSheet_menu_state.dart
│   │       ├── bottomSheet_menu_state.freezed.dart
│   │       └── widget
│   │           ├── bottomSheet_classification_options.dart
│   │           ├── bottomSheet_classification.dart
│   │           └── bottomSheet_title.dart
│   └── 9_store_review
│       ├── 9.1_store_review_container.dart
│       ├── 9.2_store_review_summary.dart
│       ├── 9.3_store_reivew_photo_review.dart
│       ├── 9.4_store_review_navigator.dart
│       ├── 9.5_store_review_content.dart
│       ├── 9.6_store_review_best_content_detail.dart
│       ├── 9.6.1_store_review_content_detail.dart
│       ├── 9.7_store_review_photo_review_detail.dart
│       ├── 9.8_store_review_content_dialog.dart
│       └── store_review_dio
│           └── store_review_dio.dart
└── repository
    ├── affiliated_store_api
    │   ├── affiliated_store_remote_repository.dart
    │   ├── affiliated_store_remote_response.dart
    │   ├── affiliated_store_remote_response.freezed.dart
    │   ├── affiliated_store_remote_response.g.dart
    │   ├── affiliated_store_remote_service.dart
    │   └── affiliated_store_remote_source.dart
    ├── cart_api
    │   ├── cart_remote_repository.dart
    │   ├── cart_reomte_response.dart
    │   ├── cart_reomte_response.freezed.dart
    │   ├── cart_reomte_response.g.dart
    │   ├── cart_reomte_service.dart
    │   └── cart_reomte_source.dart
    ├── menu_option_api
    │   ├── menu_option_remote_repository.dart
    │   ├── menu_option_remote_response.dart
    │   ├── menu_option_remote_response.freezed.dart
    │   ├── menu_option_remote_response.g.dart
    │   ├── menu_option_remote_service.dart
    │   └── menu_option_remote_source.dart
    ├── naver_map_api
    │   ├── naver_map_local_source.dart
    │   ├── naver_map_remote_repository.dart
    │   ├── naver_map_remote_source.dart
    │   ├── nver_map_response.dart
    │   ├── nver_map_response.freezed.dart
    │   └── nver_map_response.g.dart
    └── start_api
        ├── start_remote_local.dart
        ├── start_remote_repository.dart
        ├── start_remote_response.dart
        ├── start_remote_response.freezed.dart
        ├── start_remote_response.g.dart
        └── start_reomte_source.dart''';
  static const String detailedLinesOutput =
      '''      53 lib/coreService/isar/naver_map/naver_map_data_service.dart
      39 lib/coreService/isar/naver_map/naver_map_category_service.dart
      79 lib/coreService/isar/naver_map/data/naver_map_data.dart
    2700 lib/coreService/isar/naver_map/data/naver_map_data.g.dart
     657 lib/coreService/isar/naver_map/data/naver_map_category.g.dart
      18 lib/coreService/isar/naver_map/data/naver_map_version.dart
      19 lib/coreService/isar/naver_map/data/naver_map_category.dart
     686 lib/coreService/isar/naver_map/data/naver_map_version.g.dart
      46 lib/coreService/isar/naver_map/naver_map_version_service.dart
      28 lib/coreService/isar/isar_init_service.dart
      28 lib/coreService/isar/app_version/app_version_service.dart
      21 lib/coreService/isar/app_version/data/version.dart
     434 lib/coreService/isar/app_version/data/version.g.dart
     497 lib/coreService/provider.dart
      89 lib/coreService/routes.dart
      24 lib/coreService/core/di/injector.dart
     148 lib/coreService/core/di/injector.config.dart
      69 lib/coreService/core/utils/verifty_form.dart
      21 lib/coreService/core/utils/responsive_size.dart
       1 lib/coreService/core/utils/image_url_helper.dart
      45 lib/coreService/core/utils/scroll_controller_mixin.dart
      62 lib/coreService/core/dio/dio_core.dart
      63 lib/coreService/core/dio/dio_interceptor_cache.dart
      95 lib/coreService/core/service/location_service.dart
      24 lib/coreService/core/permission/permission_handler.dart
      37 lib/coreService/widgetifsai_button_components/wide_green_button.dart
     153 lib/coreService/widget/custom_appbar.dart
     111 lib/coreService/widget/searchbar.dart
      27 lib/coreService/widget/banner.dart
     180 lib/coreService/widget/store_components/store_info_summary.dart
      86 lib/coreService/widget/store_components/store_quantity_controller.dart
     266 lib/coreService/widget/store_components/store_menu_category_detail.dart
      86 lib/coreService/widget/store_components/store_menu_category.dart
      68 lib/coreService/widget/store_components/store_rating_summary.dart
     338 lib/coreService/widget/store_container.dart
     278 lib/coreService/widget/bottom_navigation.dart
     105 lib/coreService/widget/mypage_filter_button.dart
     125 lib/coreService/widget/paginationIndicator.dart
     148 lib/coreService/Shimmer_loading/loding_gif_IFSAI.dart
     516 lib/coreService/Shimmer_loading/main_shimmer.dart
      39 lib/coreService/Sharedpreferences.dart
      22 lib/coreService/kakao_api_service.dart
     137 lib/coreService/Dialog/myCart_dialog.dart
     110 lib/coreService/Dialog/my_page_event_end_dialog.dart
      94 lib/coreService/Dialog/start_service_maintenance_notice.dart
     190 lib/coreService/Dialog/login_dialog.dart
     135 lib/coreService/Dialog/my_page_review_delete_dialog.dart
     135 lib/coreService/Dialog/my_page_orderlist_delete_dialog.dart
     158 lib/coreService/Dialog/partnership_request_delete_diaglog.dart
     136 lib/coreService/Dialog/partnership_request_save_dialog.dart
     295 lib/coreService/Dialog/locationPermissionDialog.dart
     100 lib/coreService/Dialog/partnership_request_email_different_dialog.dart
      48 lib/coreService/theme.dart
       8 lib/coreService/bloc/page_navigation/page_state.dart
      21 lib/coreService/bloc/page_navigation/page_bloc.dart
      11 lib/coreService/bloc/page_navigation/page_event.dart
     134 lib/repository/cart_api/cart_reomte_response.dart
      21 lib/repository/cart_api/cart_reomte_service.dart
      21 lib/repository/cart_api/cart_reomte_source.dart
    1311 lib/repository/cart_api/cart_reomte_response.freezed.dart
      23 lib/repository/cart_api/cart_remote_repository.dart
     119 lib/repository/cart_api/cart_reomte_response.g.dart
      31 lib/repository/naver_map_api/naver_map_remote_repository.dart
      64 lib/repository/naver_map_api/nver_map_response.g.dart
      16 lib/repository/naver_map_api/naver_map_remote_source.dart
      32 lib/repository/naver_map_api/naver_map_local_source.dart
     650 lib/repository/naver_map_api/nver_map_response.freezed.dart
      74 lib/repository/naver_map_api/nver_map_response.dart
      25 lib/repository/menu_option_api/menu_option_remote_service.dart
      61 lib/repository/menu_option_api/menu_option_remote_response.g.dart
      67 lib/repository/menu_option_api/menu_option_remote_response.dart
      25 lib/repository/menu_option_api/menu_option_remote_repository.dart
      21 lib/repository/menu_option_api/menu_option_remote_source.dart
     594 lib/repository/menu_option_api/menu_option_remote_response.freezed.dart
      44 lib/repository/affiliated_store_api/affiliated_store_remote_response.g.dart
      81 lib/repository/affiliated_store_api/affiliated_store_remote_response.dart
     600 lib/repository/affiliated_store_api/affiliated_store_remote_response.freezed.dart
      21 lib/repository/affiliated_store_api/affiliated_store_remote_repository.dart
      22 lib/repository/affiliated_store_api/affiliated_store_remote_source.dart
      21 lib/repository/affiliated_store_api/affiliated_store_remote_service.dart
      13 lib/repository/start_api/start_reomte_source.dart
     198 lib/repository/start_api/start_remote_response.freezed.dart
      31 lib/repository/start_api/start_remote_local.dart
      43 lib/repository/start_api/start_remote_repository.dart
      23 lib/repository/start_api/start_remote_response.g.dart
      27 lib/repository/start_api/start_remote_response.dart
     210 lib/Page/7_partnership_request_page/1.partnership_mainPage/7.1.1._partnership_request_category.dart
     599 lib/Page/7_partnership_request_page/1.partnership_mainPage/7.1_partnership_request_screen.dart
     334 lib/Page/7_partnership_request_page/1.partnership_mainPage/7.1.2_partnership_request_customContainerBoard.dart
      92 lib/Page/7_partnership_request_page/2.partnership_formpage/7.2.1_partnership_request_form_textfield.dart
     108 lib/Page/7_partnership_request_page/2.partnership_formpage/7.2.2_partnership_request_form_button.dart
     603 lib/Page/7_partnership_request_page/2.partnership_formpage/7.2_partnership_request_form.dart
      96 lib/Page/7_partnership_request_page/4.partnership_detail_page/7.4.2_partnership_detail_title.dart
     259 lib/Page/7_partnership_request_page/4.partnership_detail_page/7.4.1_parthership_detail_comment.dart
     193 lib/Page/7_partnership_request_page/4.partnership_detail_page/7.4.3_partnership_detail_userinfo.dart
     481 lib/Page/7_partnership_request_page/4.partnership_detail_page/7.4_partnership_detail_page.dart
     179 lib/Page/7_partnership_request_page/3.partnership_formpage_detail/7.3.2_partnership_kakaoMap.dart
     109 lib/Page/7_partnership_request_page/3.partnership_formpage_detail/7.3_partnership_search.dart
      63 lib/Page/7_partnership_request_page/3.partnership_formpage_detail/7.3.1_partnership_searchScreen.dart
     561 lib/Page/7_partnership_request_page/0.partnership_dio/partnership_screen_dio.dart
     594 lib/Page/7_partnership_request_page/7.5_parthership_request_change_form.dart
     382 lib/Page/8_detail_store/8.6_detail_coupons.dart
     192 lib/Page/8_detail_store/8.1_detail_store_title.dart
      68 lib/Page/8_detail_store/8.3_detail_store_event.dart
     198 lib/Page/8_detail_store/8.4_detail_store_appbarcategory.dart
     141 lib/Page/8_detail_store/8.4.1_detail_store_appbarcategory_Icon.dart
     100 lib/Page/8_detail_store/8.2_detail_store_notice.dart
      16 lib/Page/8_detail_store/menu_option/bottomSheet_menu_state.dart
     231 lib/Page/8_detail_store/menu_option/bottomSheet_menu_state.freezed.dart
     208 lib/Page/8_detail_store/menu_option/bottomSheet_menu_page.dart
      57 lib/Page/8_detail_store/menu_option/widget/bottomSheet_classification.dart
     108 lib/Page/8_detail_store/menu_option/widget/bottomSheet_title.dart
     271 lib/Page/8_detail_store/menu_option/widget/bottomSheet_classification_options.dart
      82 lib/Page/8_detail_store/menu_option/bottomSheet_menu_cubit.dart
     366 lib/Page/8_detail_store/8_detail_store.dart
     268 lib/Page/8_detail_store/detail_store_dio/detail_dio.dart
     274 lib/Page/2_login_page/login_dio/login_dio.dart
     204 lib/Page/2_login_page/2_login.dart
      80 lib/Page/2_login_page/2.1_login_error.dart
      40 lib/Page/2_login_page/snsLogin/apple_login.dart
     200 lib/Page/2_login_page/snsLogin/kakao_login.dart
     145 lib/Page/2_login_page/snsLogin/naver_login.dart
     141 lib/Page/2_login_page/snsLogin/google_login.dart
     376 lib/Page/4_main_page/main_dio/main_screen_dio.dart
     363 lib/Page/4_main_page/4.1_main_logo_searchbar.dart
     248 lib/Page/4_main_page/4.5_main_new_store.dart
     613 lib/Page/4_main_page/4_main_screen.dart
      34 lib/Page/4_main_page/4.7_main_hot_promotion.dart
     223 lib/Page/4_main_page/4.6.1_main_best_review_contauner.dart
      26 lib/Page/4_main_page/components/main_Add_banner.dart
      27 lib/Page/4_main_page/components/main_SmoothPageIndicator.dart
      62 lib/Page/4_main_page/components/main_title_overview.dart
      32 lib/Page/4_main_page/components/main_container.dart
     119 lib/Page/4_main_page/4.6_main_best_review.dart
      93 lib/Page/4_main_page/4.3_main_category.dart
      26 lib/Page/4_main_page/4.2_main_adBanner.dart
      83 lib/Page/4_main_page/4.9_main_tourist_attractions.dart
     108 lib/Page/4_main_page/4.0_main_page.dart
     403 lib/Page/4_main_page/4.10_main_quest.dart
     411 lib/Page/4_main_page/4.4.1_main_top_12_container.dart
     360 lib/Page/4_main_page/main_detail_page/1_detail_new_store.dart
     356 lib/Page/4_main_page/main_detail_page/4_detail_quest.dart
     376 lib/Page/4_main_page/main_detail_page/3.2_detail_category_eating.dart
     197 lib/Page/4_main_page/main_detail_page/0_detail_join_us.dart
     274 lib/Page/4_main_page/main_detail_page/2_detail_top_12.dart
     519 lib/Page/4_main_page/main_detail_page/5_detail_all_quest.dart
     549 lib/Page/4_main_page/main_detail_page/3.1_detail_category_attraction.dart
     189 lib/Page/4_main_page/4.11_join_us.dart
      94 lib/Page/4_main_page/4.9.1_main_tourist_container.dart
     196 lib/Page/4_main_page/4.4_main_top12.dart
     385 lib/Page/4_main_page/4.10.1_main_quest_guest.dart
     580 lib/Page/12_naver_map/page/NaverMapApp_state.freezed.dart
      67 lib/Page/12_naver_map/page/NaverMapApp_state.dart
      62 lib/Page/12_naver_map/page/widget/market_widget.dart
      80 lib/Page/12_naver_map/page/widget/top_category.dart
      69 lib/Page/12_naver_map/page/widget/search_category_section.dart
      29 lib/Page/12_naver_map/page/widget/current_location_button.dart
      88 lib/Page/12_naver_map/page/widget/naver_map_widget.dart
     156 lib/Page/12_naver_map/page/NaverMapApp_page.dart
     482 lib/Page/12_naver_map/page/NaverMapApp_cubit.dart
     457 lib/Page/12_naver_map/page/bottom_sheet/widget/long_panel.dart
     133 lib/Page/12_naver_map/page/bottom_sheet/widget/short_panel.dart
      66 lib/Page/12_naver_map/page/bottom_sheet/bottom_panel.dart
      62 lib/Page/12_naver_map/dio/naver_map_dio.dart
      84 lib/Page/12_naver_map/service/naver_map_service.dart
      53 lib/Page/12_naver_map/service/naver_map_overlay.dart
      83 lib/Page/14_affiliated_store/dio/affiliated_dio.dart
     263 lib/Page/14_affiliated_store/pages/affiliated_page/affiliated_store_state.freezed.dart
      23 lib/Page/14_affiliated_store/pages/affiliated_page/affiliated_store_state.dart
      71 lib/Page/14_affiliated_store/pages/affiliated_page/affiliated_store_cubit.dart
     128 lib/Page/14_affiliated_store/pages/affiliated_page/affiliated_store_page.dart
     240 lib/Page/14_affiliated_store/pages/affiliated_page/widgets/store_container.dart
     437 lib/Page/6_search_results_page/6_search_results_screen.dart
      52 lib/Page/6_search_results_page/search_result_dio/search_screen_dio.dart
     159 lib/Page/15_invite_page/15.2_invite_container.dart
     196 lib/Page/15_invite_page/15.1_invite_detail_page.dart
     228 lib/Page/3_student_email_page/3.3_error_dialog.dart
     314 lib/Page/3_student_email_page/3.2_student_email_check.dart
     217 lib/Page/3_student_email_page/3.7_loginChageToSns/3.7.1_students_snstoggle_naver.dart
     263 lib/Page/3_student_email_page/3.7_loginChageToSns/3.7.2_students_snstoggle_kakao.dart
     180 lib/Page/3_student_email_page/3.7_student_account_transfer_dialog.dart
     112 lib/Page/3_student_email_page/3.4_success_dialog.dart
     154 lib/Page/3_student_email_page/3_student_identity_detail.dart
     367 lib/Page/3_student_email_page/3.1_student_email.dart
     116 lib/Page/3_student_email_page/3.6_students_success_screen.dart
     213 lib/Page/3_student_email_page/3.5_email_error_dialog.dart
     254 lib/Page/11_shopping_cart/core/shopping_cart_dio/my_shopping_cart_dio.dart
     164 lib/Page/11_shopping_cart/core/shopping_cart_provider/my_shopping_cart_state.dart
      98 lib/Page/11_shopping_cart/pages/shopping_page/shopping_cart_cubit.dart
     143 lib/Page/11_shopping_cart/pages/shopping_page/widget/recommended_side_menu.dart
     260 lib/Page/11_shopping_cart/pages/shopping_page/widget/11.2_my_shopping_cart_menulistview.dart
     108 lib/Page/11_shopping_cart/pages/shopping_page/widget/11.1_my_shopping_cart_storelistview.dart
     284 lib/Page/11_shopping_cart/pages/shopping_page/shopping_cart_page.dart
     202 lib/Page/11_shopping_cart/pages/shopping_page/shopping_cart_state.freezed.dart
      18 lib/Page/11_shopping_cart/pages/shopping_page/shopping_cart_state.dart
     234 lib/Page/11_shopping_cart/pages/shopping_option_page/shopping_option_state.freezed.dart
     116 lib/Page/11_shopping_cart/pages/shopping_option_page/widget/shopping_Item_detail_card.dart
     133 lib/Page/11_shopping_cart/pages/shopping_option_page/shopping_option_page.dart
      88 lib/Page/11_shopping_cart/pages/shopping_option_page/shopping_option_cubit.dart
      17 lib/Page/11_shopping_cart/pages/shopping_option_page/shopping_option_state.dart
     165 lib/Page/5_search_page/5.2_search_logic.dart
     157 lib/Page/5_search_page/5.2.3_search_logic_category.dart
     231 lib/Page/5_search_page/search_dio/search_screen_dio.dart
     129 lib/Page/5_search_page/5.2.4_search_logic_trending.dart
     115 lib/Page/5_search_page/5.2.2_search_logic_keywords.dart
     106 lib/Page/5_search_page/5.1.1_searcscreen.dart
     311 lib/Page/5_search_page/5.2.1_search_logic_history.dart
      51 lib/Page/9_store_review/9.5_store_review_content.dart
     195 lib/Page/9_store_review/9.2_store_review_summary.dart
     176 lib/Page/9_store_review/9.3_store_reivew_photo_review.dart
     309 lib/Page/9_store_review/9.6.1_store_review_content_detail.dart
      91 lib/Page/9_store_review/9.4_store_review_navigator.dart
     115 lib/Page/9_store_review/9.1_store_review_container.dart
     321 lib/Page/9_store_review/9.6_store_review_best_content_detail.dart
     192 lib/Page/9_store_review/store_review_dio/store_review_dio.dart
     114 lib/Page/9_store_review/9.7_store_review_photo_review_detail.dart
     324 lib/Page/9_store_review/9.8_store_review_content_dialog.dart
      20 lib/Page/1_start_page/page/start_state.dart
     192 lib/Page/1_start_page/page/start_state.freezed.dart
      48 lib/Page/1_start_page/page/start_cubit.dart
     157 lib/Page/1_start_page/page/start_page.dart
      46 lib/Page/1_start_pageservice/start_reomte_service.dart
     268 lib/Page/10_my_page/10.13_my_page_review_detail.dart
      68 lib/Page/10_my_page/10.12_my_page_review_fix_back.dart
     234 lib/Page/10_my_page/10.7_my_page_orderlist.dart
      83 lib/Page/10_my_page/10.9_my_page_review.dart
     339 lib/Page/10_my_page/10.5_my_coupon.dart
     240 lib/Page/10_my_page/10.14.2_my_page_myinfo_editmode.dart
     191 lib/Page/10_my_page/10.9.1_my_page_review_write_list.dart
     179 lib/Page/10_my_page/10.9.2_my_page_review_already_write_list.dart
     297 lib/Page/10_my_page/10.1_my_page_notice.dart
     189 lib/Page/10_my_page/10.14.1_my_page_myinfo_viewmode.dart
     230 lib/Page/10_my_page/10.2_my_page_notice_detail.dart
     228 lib/Page/10_my_page/10.10_my_page_review_write_comp.dart
     419 lib/Page/10_my_page/10.6_my_wishlist.dart
     254 lib/Page/10_my_page/10.3_my_page_event.dart
      70 lib/Page/10_my_page/10.11_my_page_review_write_back.dart
      81 lib/Page/10_my_page/10.14_my_page_myinfo.dart
     425 lib/Page/10_my_page/10.8_my_page_orderlist_detail.dart
     286 lib/Page/10_my_page/10.15_my_page_setting.dart
     716 lib/Page/10_my_page/10_my_page.dart
     333 lib/Page/10_my_page/my_page_dio/my_page_dio.dart
     178 lib/Page/10_my_page/10.4_my_page_event_detail.dart
     334 lib/Page/13_join_us/13.2_join_us_request_page.dart
     121 lib/Page/13_join_us/13.1.2_join_us_detail_comment.dart
     436 lib/Page/13_join_us/13.1_join_us_detail_page.dart
     180 lib/main.dart
     152 lib/model/location.freezed.dart
     523 lib/model/menus_option.freezed.dart
     173 lib/model/ifsai.freezed.dart
      12 lib/model/ifsai.dart
     925 lib/model/cart.freezed.dart
      30 lib/model/menus_option.dart
      11 lib/model/location.dart
      24 lib/model/market.dart
     450 lib/model/affiliated_store.freezed.dart
     447 lib/model/market.freezed.dart
      53 lib/model/cart.dart
      24 lib/model/affiliated_store.dart
   50688 total''';
}

class TechBlogPostConstants {
  static const List<Map<String, String>> techPosts = [
    {'title': 'MVVM 패턴', 'tags': '#MVVM #Architecture #Pattern'},
    {'title': 'Clean Architecture', 'tags': '#Clean #Architecture #DDD'},
    {'title': 'BLoC Pattern', 'tags': '#BLoC #State Management #Flutter'},
    {'title': 'Provider 상태관리', 'tags': '#Provider #State Management'},
    {'title': 'GetIt 의존성 주입', 'tags': '#GetIt #DI #Dependency Injection'},
    {'title': 'Repository 패턴', 'tags': '#Repository #Pattern #Data Layer'},
    {
      'title': 'Freezed 데이터 클래스',
      'tags': '#Freezed #Data Class #Code Generation',
    },
    {'title': 'Dio HTTP 클라이언트', 'tags': '#Dio #HTTP #API'},
    {'title': 'Flutter 애니메이션', 'tags': '#Flutter #Animation #UI'},
    {'title': 'Rive 애니메이션', 'tags': '#Rive #Animation #Interactive'},
    {'title': 'Custom Widget 만들기', 'tags': '#Custom Widget #Flutter #UI'},
    {'title': 'Flutter 생명주기', 'tags': '#Lifecycle #Flutter #Widget'},
    {'title': 'Flutter 테스트', 'tags': '#Test #Unit Test #Widget Test'},
    {'title': 'Firebase 연동', 'tags': '#Firebase #Backend #Database'},
    {
      'title': 'Flutter Web 최적화',
      'tags': '#Flutter Web #Optimization #Performance',
    },
    {'title': 'Flutter 성능 최적화', 'tags': '#Performance #Optimization #Flutter'},
    {'title': 'Flutter 디버깅', 'tags': '#Debug #Flutter #Development'},
    {'title': 'Flutter 패키지 개발', 'tags': '#Package #Plugin #Flutter'},
    {
      'title': 'Flutter 국제화',
      'tags': '#Internationalization #i18n #Localization',
    },
    {'title': 'Flutter 접근성', 'tags': '#Accessibility #A11y #Flutter'},
    {'title': 'Flutter 보안', 'tags': '#Security #Flutter #App Security'},
    {'title': 'Flutter 배포', 'tags': '#Deploy #Release #Store'},
    {'title': 'Dart 언어 심화', 'tags': '#Dart #Language #Advanced'},
    {'title': 'Flutter 위젯 트리', 'tags': '#Widget Tree #Flutter #Architecture'},
    {'title': 'Flutter 렌더링', 'tags': '#Rendering #Flutter #Performance'},
    {
      'title': 'Flutter 플랫폼 채널',
      'tags': '#Platform Channel #Native #Integration',
    },
    {'title': 'Flutter 플러그인 개발', 'tags': '#Plugin #Native #Flutter'},
    {'title': 'Flutter CI/CD', 'tags': '#CI/CD #DevOps #Automation'},
    {'title': 'Flutter 코드 리뷰', 'tags': '#Code Review #Best Practice #Quality'},
    {'title': 'Flutter 아키텍처 패턴', 'tags': '#Architecture #Pattern #Design'},
    {'title': 'Flutter 상태 복원', 'tags': '#State Restoration #Flutter #UX'},
    {
      'title': 'Flutter 메모리 관리',
      'tags': '#Memory Management #Performance #Flutter',
    },
    {'title': 'Flutter 네트워킹', 'tags': '#Networking #HTTP #API'},
    {'title': 'Flutter 데이터베이스', 'tags': '#Database #SQLite #Local Storage'},
    {'title': 'Flutter 파일 시스템', 'tags': '#File System #Storage #Flutter'},
    {'title': 'Flutter 센서 활용', 'tags': '#Sensor #Hardware #Flutter'},
    {'title': 'Flutter 지도 연동', 'tags': '#Map #Location #GPS'},
    {'title': 'Flutter 카메라 활용', 'tags': '#Camera #Media #Flutter'},
    {'title': 'Flutter 푸시 알림', 'tags': '#Push Notification #FCM #Messaging'},
    {'title': 'Flutter 백그라운드 작업', 'tags': '#Background Task #Service #Flutter'},
    {'title': 'PopupMenuButton', 'tags': '#PopupMenuButton #Menu #Popup'},
    {
      'title': 'CachedNetworkImage',
      'tags': '#CachedNetworkImage #Image Cache #Network Image',
    },
    {'title': 'dio 캐시 처리', 'tags': '#Dio #Cache #HTTP Cache #Interceptor'},
    {'title': '캘린더 라이브러리', 'tags': '#Calendar #Date Picker #Library'},
    {
      'title': 'NaverMap with Flutter',
      'tags': '#Naver Map #Map Widget #Location',
    },
    {
      'title': '바텀 네비게이션 바 (구글)',
      'tags': '#BottomNavigationBar #Navigation #Google Style',
    },
    {'title': '물결 애니메이션', 'tags': '#Wave Animation #Custom Animation #Ripple'},
    {'title': '그라디언트', 'tags': '#Gradient #LinearGradient #RadialGradient'},
    {
      'title': '⭐ 반짝이는 별 애니메이션 구현 기록',
      'tags': '#Star Animation #Sparkle #Custom Animation',
    },
  ];
}
