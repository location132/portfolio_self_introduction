import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:isar/isar.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:my_dream/Page/11_shopping_cart/core/shopping_cart_provider/my_shopping_cart_state.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/coreService/bloc/page_navigation/page_bloc.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:provider/provider.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/routes.dart';
import 'package:my_dream/coreService/core/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // .env 파일 로드
  await dotenv.load(fileName: '.env');

  await Isar.initializeIsarCore();

  // 의존성 주입 초기화
  Injector.init();

  // 가로모드 방지
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 루팅 및 탈옥 방지
  // bool jailbroken = await FlutterJailbreakDetection.jailbroken;
  // if (jailbroken /*|| developerMode*/) {
  //   exit(0);
  // }

  // 네이버 지도 초기화
  await NaverMapSdk.instance.initialize(
    clientId: dotenv.env['NAVER_CLIENT_ID']!,
    onAuthFailed: (e) => print("네이버 지도 인증 실패: $e"),
  );

  // API URL 환경 변수 가져오기
  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_APP_KEY']!);
  AuthRepository.initialize(appKey: dotenv.env['KAKAO_Javascript_KEY']!);

  String urlImg = '';
  int basketCount = 0;
  bool isStudent = false;
  bool isTokenValid = false;
  String studentEmail = '';
  const storage = FlutterSecureStorage();
  String? accessToken = await storage.read(key: 'accessToken');
  bool isLoggedIn = accessToken != null;
  if (isLoggedIn) {
    isTokenValid = await acconutsTK();
    if (isTokenValid) {
      var roleResult = await patchRoleSendSever(); // 프로필 조회
      urlImg = roleResult['image'].toString();
      studentEmail = roleResult['userEmail'].toString();
      basketCount = roleResult['basketCount'];
      isStudent = roleResult['school'];
    }
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginModel()),
        ChangeNotifierProvider(create: (_) => JoinModel()),
        ChangeNotifierProvider(create: (_) => SearchBarModel()),
        ChangeNotifierProvider(create: (_) => SearchScreenModel()),
        ChangeNotifierProvider(create: (_) => SearchBarModel2()),
        ChangeNotifierProvider(create: (_) => PartnershipRequestModel()),
        ChangeNotifierProvider(create: (_) => PartnershipRequestChangeModel()),
        ChangeNotifierProvider(create: (_) => PageRoutes()),
        ChangeNotifierProvider(create: (_) => MenuPrice()),
        ChangeNotifierProvider(create: (_) => ResetStorePage()),
        ChangeNotifierProvider(create: (_) => ResetMyPage()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => MyCartLengthProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavigationModel()),
        ChangeNotifierProvider(create: (_) => NaverMapProvider()),
        //---------bloc------------//
        BlocProvider<ReviewPageNavigatorBloc>(
          create: (context) => ReviewPageNavigatorBloc(),
        ),
      ],
      child: MyApp(
          isLoggedIn: isTokenValid,
          urlImg: urlImg,
          basketCount: basketCount,
          isStudent: isStudent,
          studentEmail: studentEmail),
    ),
  );
}

class MyApp extends StatefulWidget {
  final bool isLoggedIn;
  final String urlImg;
  final int basketCount;
  final bool isStudent;
  final String studentEmail;
  const MyApp(
      {super.key,
      required this.isLoggedIn,
      required this.urlImg,
      required this.basketCount,
      required this.isStudent,
      required this.studentEmail});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loginState();
    });
  }

  void loginState() {
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final myCartLengthProvider =
        Provider.of<MyCartLengthProvider>(context, listen: false);
    if (widget.isLoggedIn) {
      loginStatus.setloginStatus(true);
      loginStatus.setBasketCount(widget.basketCount);
      loginStatus.setOnProfileImageReceived(widget.urlImg);
      myCartLengthProvider.setMyCartLength(widget.basketCount);
      loginStatus.setIsStudent(widget.isStudent);
      loginStatus.setStudentEmail(widget.studentEmail);
    } else {
      loginStatus.setloginStatus(false);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 사용자 탭 감지
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: appRoutes,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFDFDFD), // #FDFDFD 색상 적용
        ),
        initialRoute: widget.isLoggedIn ? '/MainScreen' : '/StartPage',
        builder: (context, child) {
          ResponsiveSize.init(context); // 반응형 크기 초기화
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler:
                  const TextScaler.linear(1.0), // 사용자가 정의한 글자 크기를 무시하고 기본값으로 설정
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
