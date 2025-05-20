import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_cubit.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_state.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/intro_view/intro_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/navi_bar.dart';

class MobilePage extends StatelessWidget {
  final String deviceType;
  final bool isMobileDevice;
  const MobilePage({
    super.key,
    required this.deviceType,
    required this.isMobileDevice,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<MobileCubit>(),
      child: _MobileView(
        deviceType: deviceType,
        isMobileDevice: isMobileDevice,
      ),
    );
  }
}

class _MobileView extends StatefulWidget {
  final String deviceType;
  final bool isMobileDevice;
  const _MobileView({
    required this.deviceType,
    required this.isMobileDevice,
  });

  @override
  State<_MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<_MobileView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MobileCubit, MobileState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                NaviBar(deviceType: widget.deviceType),
                IntroPage(deviceType: widget.deviceType),
              ],
            ),
          ),
        );
      },
    );
  }
}
