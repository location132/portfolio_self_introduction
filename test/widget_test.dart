import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/components/rive/banner_rive.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_cubit.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
          ),
          height: 300.sh,
          child: Stack(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                  width: 1250.sw,
                  height: 140.sh,
                  child: AnimatedOpacity(
                    opacity: state.stateBannerText == '' ? 0 : 1,
                    duration: const Duration(milliseconds: 1000),
                    child: Text(
                      state.stateBannerText,
                      style: TextStyle(
                        fontSize: 14.sh,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              BannerRive(
                  onStateChange: context.read<MainPageCubit>().onStateChange),
            ],
          ),
        );
      },
    );
  }
}
