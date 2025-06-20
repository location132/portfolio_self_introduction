import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/Page/1_start_page/page/start_cubit.dart';
import 'package:my_dream/Page/1_start_page/page/start_state.dart';
import 'package:my_dream/coreService/Dialog/login_dialog.dart';
import 'package:my_dream/coreService/Dialog/start_service_maintenance_notice.dart';
import 'package:my_dream/coreService/core/di/injector.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<StartCubit>(),
      child: const StartView(),
    );
  }
}

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  void initState() {
    super.initState();
    context.read<StartCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<StartCubit, StartState>(
          builder: (context, state) {
            if (state.screenState == ScreenState.error) {
              // WidgetsBinding.instance.addPostFrameCallback((_) {
              //   handleLoginResult(context);
              // });
            } else if (state.screenState == ScreenState.update) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showLoginDialog(context, LoginDialogType.update);
              });
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sw),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  Image.asset(
                    'assets/images/ifSaiLogo.png',
                    width: 207,
                  ),
                  SizedBox(height: 50.sh),
                  const Text(
                    '다양한 쿠폰과 혜택을 한번에\n지금 잎사이에서 만나보세요!',
                    style: TextStyle(
                      color: Color(0xff111111),
                      fontSize: 22,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  SizedBox(height: 204.sh),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff6fbf8a),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {
                          final joinStatus =
                              Provider.of<JoinModel>(context, listen: false);
                          joinStatus.setIsFirstClickSNSLogin(true);

                          Navigator.pushNamed(context, '/LoginPage');
                        },
                        child: const Center(
                          child: Text(
                            '잎사이 시작하기',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4.sh),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 25),
                      const Text(
                        '회원가입 없이',
                        style: TextStyle(
                          color: Color(0xff6c6c6c),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                      const SizedBox(width: 5),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/MainScreen');
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black)),
                                  ),
                                  child: const Text(
                                    '메인화면 둘러보기',
                                    style: TextStyle(
                                      color: Color(0xff757575),
                                      fontSize: 12,
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17.sh),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
