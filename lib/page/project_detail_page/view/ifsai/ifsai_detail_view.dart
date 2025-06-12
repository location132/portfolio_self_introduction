import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/model/project_detail/ifsai_model.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/project_detail_section.dart';

class IfsaiDetailPage extends StatelessWidget {
  const IfsaiDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<IfsaiCubit>(),
      child: IfsaiDetailView(),
    );
  }
}

class IfsaiDetailView extends StatelessWidget {
  const IfsaiDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IfsaiCubit, IfsaiState>(
      builder: (context, state) {
        return Stack(
          children: [
            SingleChildScrollView(
              controller: state.scrollController,
              physics:
                  state.isScrollEnabled
                      ? const BouncingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height - 83),
                  Container(
                    height: MediaQuery.of(context).size.height * 2,
                    child: const Center(
                      child: Text(
                        '여기서부터 실제 뷰가 시작됩니다.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ProjectDetailSection(
              model: IfsaiModel(),
              mainTitleOpacity: state.mainTitleOpacity,
              descriptionOpacity: state.descriptionOpacity,
              titleOpacity: state.titleOpacity,
              titleScale: state.titleScale,
              setScrollEnabled:
                  (isEnabled) =>
                      context.read<IfsaiCubit>().setScrollEnabled(isEnabled),
            ),
          ],
        );
      },
    );
  }
}
