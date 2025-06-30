import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/post_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/title_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/expandable_content.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/my_story_start.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/story_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/code_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

class NaverLoginPage extends StatefulWidget {
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  final bool isMobile;

  const NaverLoginPage({
    super.key,
    required this.isFocused,
    this.scrollController,
    required this.isMobile,
  });

  @override
  State<NaverLoginPage> createState() => _NaverLoginPageState();
}

class _NaverLoginPageState extends State<NaverLoginPage> {
  final GlobalKey _codeExampleSectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.isFocused(true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateScrollOffset();
    });
  }

  void _calculateScrollOffset() {
    if (_codeExampleSectionKey.currentContext != null) {
      final RenderBox renderBox =
          _codeExampleSectionKey.currentContext!.findRenderObject()
              as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      final cubit = context.read<TechBlogPostDetailCubit>();
      if (widget.isMobile) {
        cubit.setScrollTargetOffset(position.dy - 0);
      } else {
        cubit.setScrollTargetOffset(position.dy - 250);
      }
    }
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
                    title: '네이버 로그인',
                    tags: const [
                      '#Naver',
                      '#Login',
                      '#OAuth',
                      '#Social Login',
                      '#Flutter',
                      '#Authentication',
                      '#SNS 로그인',
                      '#네이버',
                    ],
                    content:
                        'Flutter에서 네이버 로그인을 구현하는 방법에 대해 알아보겠습니다.\n'
                        '네이버 개발자 센터에서 앱을 등록하고, flutter_naver_login 패키지를 사용해서\n'
                        '실제 프로젝트에 네이버 로그인 기능을 구현하는 과정을 단계별로 설명합니다.\n\n'
                        '네이버 로그인은 사용자가 별도의 회원가입 없이 네이버 계정으로 간편하게 로그인할 수 있는 기능입니다.\n'
                        'OAuth 2.0 프로토콜을 기반으로 안전하게 사용자 인증을 처리할 수 있습니다.\n\n'
                        '이 글에서는 네이버 개발자 센터 설정부터 실제 Flutter 코드 구현까지\n'
                        '전체 과정을 실제 프로젝트에서 사용한 코드와 함께 소개하겠습니다.',
                    isBackgroundColor: state.isBackgroundColorWhite,
                    isMobile: widget.isMobile,
                  ),
                  SizedBox(height: widget.isMobile ? 64.h : 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '네이버 로그인이란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            '네이버 로그인은 네이버 아이디로 간편하게 로그인할 수 있는 서비스입니다.\n'
                            'OAuth 2.0 기반으로 안전한 인증을 제공하며, 사용자 동의를 받아\n'
                            '필요한 정보만 안전하게 가져올 수 있습니다.\n\n'
                            'Flutter에서는 flutter_naver_login 패키지를 사용해서\n'
                            '쉽게 네이버 로그인 기능을 구현할 수 있습니다.',
                        detailContent:
                            '네이버 로그인의 핵심 개념:\n\n'
                            '🔸 1. OAuth 2.0 프로토콜\n'
                            '  - 안전한 사용자 인증 및 권한 부여\n'
                            '  - Access Token을 통한 API 호출\n'
                            '  - 사용자 비밀번호를 앱에서 직접 다루지 않음\n\n'
                            '🔸 2. 로그인 플로우\n'
                            '  - 앱에서 네이버 로그인 요청\n'
                            '  - 네이버 앱 또는 웹브라우저에서 인증\n'
                            '  - 인증 성공 시 Access Token 발급\n'
                            '  - Token으로 사용자 정보 조회\n\n'
                            '🔸 3. 주요 장점\n'
                            '  - 사용자의 편리한 로그인 경험\n'
                            '  - 회원가입 과정 생략 가능\n'
                            '  - 네이버의 안전한 인증 시스템 활용\n'
                            '  - 프로필 정보 자동 입력 가능\n\n'
                            '🔸 4. 필요한 정보\n'
                            '  - Client ID (애플리케이션 식별자)\n'
                            '  - Client Secret (애플리케이션 비밀키)\n'
                            '  - URL Scheme (iOS용)\n'
                            '  - 사용자 동의 항목 설정',
                        toggleText: '자세한 개념이 궁금하시면 Click',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),

                      MyStoryStart(
                        isMobile: widget.isMobile,
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        codeExampleSectionKey: _codeExampleSectionKey,
                        textTitle: '프로젝트에서 구현한',
                        textSubTitle: '네이버 로그인 전체 구현 과정을 소개합니다.',
                        textSubTitle2: '\n\n\n\n소개하는 코드는 프로젝트에서 구현된 내용입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      //---------이제 내 이야기 시작------------------------
                      // 네이버 개발자 센터 설정
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '1. 네이버 개발자 센터 설정',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '네이버 로그인을 사용하기 위해서는 먼저 네이버 개발자 센터에서 애플리케이션을 등록해야 합니다.\n\n'
                            '1. 네이버 개발자 센터(https://developers.naver.com)에 접속\n'
                            '2. "Application → 애플리케이션 등록" 선택\n'
                            '3. 애플리케이션 정보 입력 및 API 권한 설정\n'
                            '4. Client ID와 Client Secret 발급받기\n\n'
                            '특히 중요한 것은 사용 API를 "네이버 로그인"으로 선택하고,\n'
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
                        title: 'pubspec.yaml - flutter_naver_login 패키지 추가',
                        language: 'yaml',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
dependencies:
  flutter:
    sdk: flutter
  flutter_naver_login: ^1.8.0
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'flutter_naver_login 패키지는 네이버에서 공식적으로 제공하는 Flutter 패키지입니다.\n'
                            '이 패키지를 사용하면 네이버 앱이 설치된 경우 앱으로, 없는 경우 웹브라우저로\n'
                            '자동으로 로그인 프로세스를 진행합니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),

                      // 실제 구현 코드
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '3.네이버 로그인 구현',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '네이버 로그인 위젯 구현',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/login/snsLogin/login_dio.dart';

class NaverLogin extends StatefulWidget {
  const NaverLogin({super.key});

  @override
  State<NaverLogin> createState() => _NaverLoginState();
}

class _NaverLoginState extends State<NaverLogin> {
  Future<void> signInWithNaver() async {
    LoginModel loginModel = LoginModel();
    
    // 네이버 로그인 실행
    await FlutterNaverLogin.logIn();
    
    // 액세스 토큰 가져오기
    final NaverAccessToken naverLogin = 
        await FlutterNaverLogin.currentAccessToken;
    
    
    /*
    // 서버에 SNS 로그인 요청 하는 코드. 서버에 토큰 같이 보내기
    */
    
    if (result) {
      if (mounted) {
        loginModel.setloginStatus(result);
        Navigator.pushNamed(context, '/StudentIdentityCheck');
      }
    } else {
      loginModel.setloginStatus(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => signInWithNaver(),
      child: Image.asset(
        'assets/naver_login.png',
      ),
    );
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '(위 코드는 비즈니스 로직과, view를 분리하지 않은 예시입니다!)\n\n'
                            '핵심은 네이버에서 받은 액세스 토큰을 서버로 전송해서\n'
                            '자체 JWT 토큰을 발급받는 구조입니다.\n\n'
                            'snsLogin() 함수는 서버 API를 호출해서 네이버 토큰을 검증하고\n'
                            '성공 시 사용자 정보를 저장한 후 다음 화면으로 이동합니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),

                      // iOS 설정
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '3. Android 설정',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'android/app/src/main/AndroidManifest.xml',
                        language: 'xml',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- 인터넷 권한 추가 -->
    <uses-permission android:name="android.permission.INTERNET" />
    
    <application
        android:label="your_app_name"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            
            <!-- 기본 Intent Filter -->
            <intent-filter android:autoVerify="true">
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        
        <!-- 네이버 로그인 콜백을 위한 Activity 추가 -->
        <activity
            android:name="com.nhn.android.naverlogin.ui.OAuthLoginActivity"
            android:theme="@android:style/Theme.Translucent.NoTitleBar" />
            
        <!-- Don't delete the meta-data below. -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
</manifest>
''',
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),

                      // iOS 설정 - Info.plist
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '4. iOS 설정 - Info.plist',
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
    <!--기본 설정 생략 -->

    <!-- 네이버 로그인에 필요한 Custom URL Scheme -->
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>your_custom_scheme</string> <!-- 여기를 네이버 앱 URL Scheme으로 교체 -->
            </array>
        </dict>
    </array>
    
    <!-- 네이버 앱에서 호출될 수 있도록 LSApplicationQueriesSchemes에 추가 -->
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>naversearchapp</string>
        <string>naversearchthirdlogin</string>
    </array>

    <!-- 네이버 로그인 설정 -->
    <key>naverConsumerKey</key>
    <string>client-id</string> <!-- 네이버 클라이언트 ID로 교체하세요 -->

    <key>naverConsumerSecret</key>
    <string>client-secret</string> <!-- 네이버 클라이언트 시크릿으로 교체하세요 -->

    <key>naverServiceAppName</key>
    <string>app_name</string> <!-- 네이버 애플리케이션 이름으로 교체하세요 -->

    <!-- 네이버 API 요청을 위한 네트워크 설정 -->
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
        <key>NSExceptionDomains</key>
        <dict>
            <key>naver.com</key>
            <dict>
                <key>NSExceptionRequiresForwardSecrecy</key>
                <false/>
                <key>NSIncludesSubdomains</key>
                <true/>
            </dict>
            <key>naver.net</key>
            <dict>
                <key>NSExceptionRequiresForwardSecrecy</key>
                <false/>
                <key>NSIncludesSubdomains</key>
                <true/>
            </dict>
        </dict>
    </dict>
    <!-- 나머지 설정들... -->
</dict>
</plist>
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      // 보안 주의사항
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '!!배포 시 보안 주의사항!!\n\n'
                            'NSAllowsArbitraryLoads를 true로 설정하면 모든 HTTP 연결을 허용하게 됩니다.\n'
                            '개발 중에는 편리하지만, 실제 배포 시에는 보안상 위험할 수 있습니다.\n\n'
                            '배포 시에는 다음과 같이 변경하는 것을 권장합니다:\n'
                            '• NSAllowsArbitraryLoads를 false로 변경\n'
                            '• 필요한 도메인만 NSExceptionDomains에 개별 설정\n'
                            '• HTTPS를 사용하도록 서버 설정 변경',
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),

                      // AppDelegate.swift 설정
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '5. 네이버 앱과 연동하기 - AppDelegate.swift',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'AppDelegate.swift 설정을 누락하면, 사용자가 네이버앱이 설치되어있을 경우\n'
                            '로그인 흐름이 끊어집니다 → 네이버 앱에서 토큰을 받아오지 못하는 상황이 발생합니다.\n\n'
                            '반드시 아래 설정을 추가해야 합니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'ios/Runner/AppDelegate.swift',
                        language: 'swift',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import UIKit
import Flutter
import NaverThirdPartyLogin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // 네이버 앱에서 돌아올 때 호출되는 메서드 (핵심!)
  override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    if NaverThirdPartyLoginConnection.getSharedInstance().application(app, open: url, options: options) {
      return true
    }

    return super.application(app, open: url, options: options)
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'application(_:open:options:) 메서드가 핵심입니다!\n\n'
                            '이 메서드는 사용자가 네이버 앱에서 로그인 후 우리 앱으로 돌아올 때 호출됩니다.\n'
                            'NaverThirdPartyLoginConnection을 통해 URL을 처리해야\n'
                            '네이버에서 전달해준 인증 정보를 정상적으로 받을 수 있습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),

                      // 로그인 플로우 설명
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '6. 네이버 로그인 플로우 정리',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '로그인 플로우 정리:\n\n'
                            '1. 사용자가 네이버 로그인 버튼 클릭\n'
                            '2. Flutter에서 FlutterNaverLogin.logIn() 호출\n'
                            '3. 네이버 앱이 설치되어 있으면 앱으로, 없으면 브라우저로 이동\n'
                            '4. 사용자가 네이버에서 로그인 완료\n'
                            '5. AppDelegate의 application(_:open:options:)가 호출됨\n'
                            '6. 네이버 액세스 토큰을 받아옴\n'
                            '7. 서버에 snsLogin() 요청으로 JWT 토큰 발급\n'
                            '8. 로그인 성공 시 다음 화면으로 이동',
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
                            '1. "로그인 후 앱으로 돌아오지 않는 문제"\n'
                            '   → AppDelegate.swift 설정 확인\n'
                            '   → Info.plist의 URL Scheme 확인\n\n'
                            '2. "개발 중에는 되는데 배포 후 안되는 문제"\n'
                            '   → NSAllowsArbitraryLoads 설정 확인\n'
                            '   → 네이버 개발자 센터에서 배포 환경 설정 확인\n\n'
                            '3. "네이버 앱에서 권한 거부 후 다시 시도 시 문제"\n'
                            '   → FlutterNaverLogin.logOut() 먼저 호출\n'
                            '   → 토큰 초기화 후 재시도\n\n'
                            '4. "Info.plist에 clientId 설정 누락"\n'
                            '   → naverConsumerKey, naverConsumerSecret 확인',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      SizedBox(height: widget.isMobile ? 100.h : 100),
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
