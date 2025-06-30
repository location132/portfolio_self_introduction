import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/post_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/title_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/story_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/code_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/expandable_content.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/my_story_start.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

class KakaoLoginPage extends StatefulWidget {
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  final bool isMobile;

  const KakaoLoginPage({
    super.key,
    required this.isFocused,
    this.scrollController,
    required this.isMobile,
  });

  @override
  State<KakaoLoginPage> createState() => _KakaoLoginPageState();
}

class _KakaoLoginPageState extends State<KakaoLoginPage> {
  final GlobalKey _codeExampleSectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.isFocused(true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
      builder: (context, state) {
        return SingleChildScrollView(
          controller: widget.scrollController,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              padding: EdgeInsets.all(widget.isMobile ? 24.0.w : 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: widget.isMobile ? 100.h : 100),
                  PostHeader(
                    title: '카카오 로그인',
                    tags: const [
                      '#Kakao',
                      '#Login',
                      '#OAuth',
                      '#Social Login',
                      '#Flutter',
                      '#Authentication',
                      '#SNS 로그인',
                      '#카카오',
                    ],
                    content:
                        'Flutter에서 카카오 로그인을 구현하는 방법에 대해 알아보겠습니다.\n'
                        '카카오 개발자 센터에서 앱을 등록하고, kakao_flutter_sdk_user 패키지를 사용해서\n'
                        '실제 프로젝트에 카카오 로그인 기능을 구현하는 과정을 단계별로 설명합니다.\n\n'
                        '카카오 로그인은 사용자가 별도의 회원가입 없이 카카오 계정으로 간편하게 로그인할 수 있는 기능입니다.\n'
                        'OAuth 2.0 프로토콜을 기반으로 안전하게 사용자 인증을 처리할 수 있습니다.',
                    isBackgroundColor: state.isBackgroundColorWhite,
                    isMobile: widget.isMobile,
                  ),
                  SizedBox(height: widget.isMobile ? 64.h : 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '카카오 로그인이란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            '카카오 로그인은 카카오 계정으로 간편하게 로그인할 수 있는 서비스입니다.\n'
                            'OAuth 2.0 기반으로 안전한 인증을 제공하며, 사용자 동의를 받아\n'
                            '필요한 정보만 안전하게 가져올 수 있습니다.\n\n'
                            'Flutter에서는 kakao_flutter_sdk_user 패키지를 사용해서\n'
                            '쉽게 카카오 로그인 기능을 구현할 수 있습니다.',
                        detailContent:
                            '카카오 로그인의 핵심 개념:\n\n'
                            '🔸 1. OAuth 2.0 프로토콜\n'
                            '  - 안전한 사용자 인증 및 권한 부여\n'
                            '  - Access Token을 통한 API 호출\n'
                            '  - 사용자 비밀번호를 앱에서 직접 다루지 않음\n\n'
                            '🔸 2. 로그인 플로우\n'
                            '  - 앱에서 카카오 로그인 요청\n'
                            '  - 카카오톡 앱 또는 웹브라우저에서 인증\n'
                            '  - 인증 성공 시 Access Token 발급\n'
                            '  - Token으로 사용자 정보 조회\n\n'
                            '🔸 3. 주요 장점\n'
                            '  - 사용자의 편리한 로그인 경험\n'
                            '  - 회원가입 과정 생략 가능\n'
                            '  - 카카오의 안전한 인증 시스템 활용\n'
                            '  - 프로필 정보 자동 입력 가능\n\n'
                            '🔸 4. 필요한 정보\n'
                            '  - Native App Key (애플리케이션 식별자)\n'
                            '  - URL Scheme (iOS용)\n'
                            '  - 사용자 동의 항목 설정\n'
                            '  - 앱 설치 여부 확인 기능',
                        toggleText: '자세한 개념이 궁금하시면 Click',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),

                      MyStoryStart(
                        isMobile: widget.isMobile,
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        codeExampleSectionKey: _codeExampleSectionKey,
                        textTitle: '프로젝트에서 구현한',
                        textSubTitle: '카카오 로그인 전체 구현 과정을 소개합니다.',
                        textSubTitle2: '\n\n\n\n소개하는 코드는 프로젝트에서 실제로 구현된 내용입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      //---------이제 내 이야기 시작------------------------
                      // 카카오 개발자 센터 설정
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '1. 카카오 개발자 센터 설정',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '카카오 로그인을 사용하기 위해서는 먼저 카카오 개발자 센터에서 애플리케이션을 등록해야 합니다.\n\n'
                            '1. 카카오 개발자 센터(https://developers.kakao.com)에 접속\n'
                            '2. "내 애플리케이션" → "애플리케이션 추가하기" 선택\n'
                            '3. 애플리케이션 정보 입력 및 플랫폼 설정\n'
                            '4. "카카오 로그인" 활성화 및 필요한 동의항목 설정\n'
                            '5. Native App Key 발급받기\n\n'
                            '중요한 것은 개발/배포 환경에 맞는 플랫폼 설정과\n'
                            '필요한 정보 제공 범위를 설정하는 것입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),

                      // 패키지 설치 및 설정
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '2. 패키지 설치 및 기본 설정',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'pubspec.yaml - kakao_flutter_sdk_user 패키지 추가',
                        language: 'yaml',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
dependencies:
  flutter:
    sdk: flutter
  kakao_flutter_sdk_user: ^1.9.1+2
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'kakao_flutter_sdk_user 패키지는 카카오에서 공식적으로 제공하는 Flutter 패키지입니다.\n'
                            '이 패키지를 사용하면 카카오톡 앱이 설치된 경우 앱으로, 없는 경우 웹브라우저로\n'
                            '자동으로 로그인 프로세스를 진행합니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),

                      // main.dart 초기화 설정
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '3. main.dart에서 카카오 SDK 초기화',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '카카오 로그인은 반드시 앱 시작 시 main.dart에서 SDK를 초기화해야 합니다.\n'
                            '이 과정을 누락하면 로그인이 정상적으로 작동하지 않습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'main.dart - 카카오 SDK 초기화',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool jailbroken = await FlutterJailbreakDetection.jailbroken;
  if (jailbroken /*|| developerMode*/) {
    exit(0);
  }

  // 카카오 SDK 초기화 (필수!)
  KakaoSdk.init(nativeAppKey: '카카오에서 제공해준 키');
  
  const storage = FlutterSecureStorage();
  String? accessToken = await storage.read(key: 'accessToken');
  bool isLoggedIn = accessToken != null;

  runApp(
    ChangeNotifierProvider(
      create: (_) => LoginModel(),
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'KakaoSdk.init()은 반드시 runApp() 호출 전에 실행되어야 합니다.\n'
                            'nativeAppKey에는 카카오 개발자 센터에서 발급받은 Native App Key를 입력합니다.\n\n'
                            '이 초기화 과정이 없으면 카카오 로그인 API 호출 시 오류가 발생합니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),

                      // 실제 구현 코드
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '4. 카카오 로그인 구현 - 단계별 접근',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '실제 프로젝트에서는 단순한 로그인뿐만 아니라 에러 처리, 로딩 상태 관리,\n'
                            '사용자 상태에 따른 네비게이션 등 다양한 요소를 고려해야 합니다.\n\n'
                            '단계별로 구현해보겠습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 40.h : 40),

                      // 1단계: 기본 로그인 로직
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '4-1. 핵심 로그인 로직',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '기본 카카오 로그인 구현',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
Future<void> signInWithKakao() async {
  OAuthToken token;

  // 카카오톡이 설치되어있으면 카카오톡으로 먼저 로그인을 시도
  if (await isKakaoTalkInstalled()) {
    try {
      token = await UserApi.instance.loginWithKakaoTalk();
      // 성공 시 처리 로직
    } catch (error) {
      // 카카오톡 로그인 실패 시 카카오 계정 로그인으로 대체
      token = await UserApi.instance.loginWithKakaoAccount();
    }
  } else {
    // 카카오톡이 설치되지 않은 경우 카카오 계정으로 로그인
    token = await UserApi.instance.loginWithKakaoAccount();
  }
  
  // 토큰을 사용해서 후속 처리
  print('로그인 성공: ${token.accessToken}');
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      // 2단계: 에러 처리 추가
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '4-2. 에러 처리 및 취소 상황 대응',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '에러 처리가 추가된 로그인',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:flutter/services.dart';

Future<void> signInWithKakao() async {
  OAuthToken token;

  if (await isKakaoTalkInstalled()) {
    try {
      token = await UserApi.instance.loginWithKakaoTalk();
      // 카카오톡 로그인 성공
      await handleLoginSuccess(token);
    } catch (error) {
      // 사용자가 취소한 경우
      if (error is PlatformException && error.code == 'CANCELED') {
        print('사용자가 로그인을 취소했습니다');
        return;
      }
      
      // 다른 오류의 경우 카카오 계정 로그인으로 시도
      try {
        token = await UserApi.instance.loginWithKakaoAccount();
        await handleLoginSuccess(token);
      } catch (error) {
        print('카카오 계정 로그인도 실패: $error');
        handleLoginFailure();
      }
    }
  } else {
    try {
      token = await UserApi.instance.loginWithKakaoAccount();
      await handleLoginSuccess(token);
    } catch (error) {
      print('카카오 계정 로그인 실패: $error');
      handleLoginFailure();
    }
  }
}

Future<void> handleLoginSuccess(OAuthToken token) async {
  // 토큰으로 서버 연동 및 사용자 정보 처리
  print('로그인 성공: ${token.accessToken}');
}

void handleLoginFailure() {
  // 로그인 실패 처리
  print('로그인에 실패했습니다');
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      // 3단계: 상태 관리 추가
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '4-3. 상태 관리 및 로딩 처리',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'Provider를 활용한 상태 관리',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
class KakaoLogin extends StatefulWidget {
  final Function(bool) onLoginResult;
  final Function(bool) isLoading;

  const KakaoLogin({
    super.key,
    required this.onLoginResult,
    required this.isLoading,
  });

  @override
  State<KakaoLogin> createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLogin> {
  Future<void> signInWithKakao() async {
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    
    // 로딩 시작
    setState(() {
      widget.isLoading(true);
    });

    OAuthToken token;

    if (await isKakaoTalkInstalled()) {
      try {
        token = await UserApi.instance.loginWithKakaoTalk();
        await processLoginResult(token, loginStatus);
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          // 사용자 취소
          widget.isLoading(false);
          widget.onLoginResult(false);
          return;
        }
        
        // 카카오 계정으로 재시도
        try {
          token = await UserApi.instance.loginWithKakaoAccount();
          await processLoginResult(token, loginStatus);
        } catch (error) {
          handleLoginError();
        }
      }
    } else {
      try {
        token = await UserApi.instance.loginWithKakaoAccount();
        await processLoginResult(token, loginStatus);
      } catch (error) {
        handleLoginError();
      }
    }
  }

  Future<void> processLoginResult(OAuthToken token, LoginModel loginStatus) async {
    // 서버 연동 로직 (실제 구현에서는 여기에 서버 API 호출)
    // var result = await snsLogin('KAKAO', token.accessToken);
    
    // 로딩 종료
    widget.isLoading(false);
    
    // 로그인 상태 업데이트
    loginStatus.setloginStatus(true);
    widget.onLoginResult(true);
  }

  void handleLoginError() {
    widget.isLoading(false);
    widget.onLoginResult(false);
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      // 4단계: UI 구현
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '4-4. 실제 UI 구현',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '카카오 로그인 버튼 UI',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@override
Widget build(BuildContext context) {
  return TextButton(
    style: TextButton.styleFrom(padding: EdgeInsets.zero),
    onPressed: signInWithKakao,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        'assets/kakao_login_medium_narrow.png',
      ),
    ),
  );
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '실제 프로젝트에서는 위의 4단계를 모두 결합한 형태로 구현됩니다:\n\n'
                            '1️⃣ 핵심 로그인 로직: 카카오톡/계정 로그인 분기\n'
                            '2️⃣ 에러 처리: CANCELED, 네트워크 오류 등 대응\n'
                            '3️⃣ 상태 관리: Provider로 로그인 상태 관리\n'
                            '4️⃣ UI 구현: 사용자 친화적인 로그인 버튼\n\n'
                            '각 단계가 유기적으로 연결되어 안정적인 로그인 기능을 제공합니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),

                      // iOS 설정 - Info.plist
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '5. iOS 설정 - Info.plist',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'ios/Runner/Info.plist',
                        language: 'xml',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <!-- 기본 설정 생략 -->

    <!-- 카카오 로그인에 필요한 Custom URL Scheme -->
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>kakao{your_kakao_app_key}</string> <!-- 여기를 카카오 앱 키로 교체하세요 (예: kakao1234567890abcdefg) -->
            </array>
        </dict>
    </array>
    
    <!-- 카카오 앱에서 호출될 수 있도록 LSApplicationQueriesSchemes에 추가 -->
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>kakaokompassauth</string>
        <string>kakaolink</string>
        <string>storykompassauth</string>
        <string>storylink</string>
    </array>

    <!-- 카카오 API 요청을 위한 네트워크 설정
     개발단계에서는 필요없음 -->
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
        <key>NSExceptionDomains</key>
        <dict>
            <key>kakao.com</key>
            <dict>
                <key>NSExceptionAllowsInsecureHTTPLoads</key>
                <true/>
                <key>NSExceptionRequiresForwardSecrecy</key>
                <false/>
                <key>NSIncludesSubdomains</key>
                <true/>
            </dict>
            <key>kakaocdn.net</key>
            <dict>
                <key>NSExceptionAllowsInsecureHTTPLoads</key>
                <true/>
                <key>NSExceptionRequiresForwardSecrecy</key>
                <false/>
                <key>NSIncludesSubdomains</key>
                <true/>
            </dict>
        </dict>
    </dict>
    <!-- 추가 설정들... -->
</dict>
</plist>
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      // 중요 포인트 설명
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '주요 설정 포인트:\n\n'
                            '1. CFBundleURLSchemes에서 "kakao{your_kakao_app_key}" 형식으로 설정\n'
                            '   → 실제 앱 키: kakao1234567890abcdefg 형태\n\n'
                            '2. LSApplicationQueriesSchemes에는 카카오 관련 4개 스킴 모두 추가\n'
                            '   → 카카오톡, 카카오링크, 스토리 등의 기능 사용을 위함\n\n'
                            '3. NSAppTransportSecurity는 개발 단계에서는 설정하지 않아도 됨\n'
                            '   → 배포 시에만 HTTPS 관련 설정 필요',
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),

                      // 카카오 로그인 플로우 정리
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '6. 카카오 로그인 플로우 정리',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '로그인 플로우 정리:\n\n'
                            '1. 사용자가 카카오 로그인 버튼 클릭\n'
                            '2. isKakaoTalkInstalled()로 카카오톡 앱 설치 여부 확인\n'
                            '3. 설치되어 있으면 loginWithKakaoTalk(), 없으면 loginWithKakaoAccount()\n'
                            '4. 사용자가 카카오에서 로그인 완료\n'
                            '5. OAuthToken 객체를 통해 액세스 토큰 받아옴\n'
                            '6. 서버에 snsLogin() 요청으로 JWT 토큰 발급\n'
                            '7. 로그인 성공 시 다음 화면으로 이동\n'
                            '8. 실패 시 에러 처리',
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),

                      // 트러블슈팅
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '7. 자주 발생하는 문제와 해결방법',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '자주 발생하는 문제들:\n\n'
                            '1. "KakaoSDK has not been initialized" 오류\n'
                            '   → main.dart에서 KakaoSdk.init() 호출 확인\n'
                            '   → runApp() 전에 초기화했는지 확인\n\n'
                            '2. "카카오톡 앱에서 로그인 후 앱으로 돌아오지 않는 문제"\n'
                            '   → Info.plist의 CFBundleURLSchemes 확인\n'
                            '   → kakao{앱키} 형식이 정확한지 확인\n\n'
                            '3. "카카오 개발자 센터에서 앱 키 불일치 오류"\n'
                            '   → Native App Key가 정확한지 확인\n'
                            '   → 개발/배포 환경별 앱 키 설정 확인\n\n'
                            '4. "사용자 정보 조회 권한 오류"\n'
                            '   → 카카오 개발자 센터에서 필요한 동의항목 활성화\n'
                            '   → 개인정보 보호정책 URL 등록 확인',
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),

                      // 네이버와 카카오 차이점
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '8. 네이버 로그인과의 차이점',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '카카오 vs 네이버 로그인 차이점:\n\n'
                            '1. 초기화 방식:\n'
                            '   • 카카오: main.dart에서 KakaoSdk.init() 필수\n'
                            '   • 네이버: Info.plist에서 설정 정보 입력\n\n'
                            '2. URL Scheme:\n'
                            '   • 카카오: kakao{앱키} 형식\n'
                            '   • 네이버: 사용자 정의 스킴\n\n'
                            '3. 앱 설치 여부 확인:\n'
                            '   • 카카오: isKakaoTalkInstalled() 직접 확인\n'
                            '   • 네이버: 패키지에서 자동 처리\n\n'
                            '4. 로그인 방식:\n'
                            '   • 카카오: 앱/웹 구분해서 다른 메서드 호출\n'
                            '   • 네이버: 단일 메서드로 자동 처리',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
