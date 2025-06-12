import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/project_detail/ifsai_model.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/project_detail_section.dart';

class IfsaiDetailView extends StatelessWidget {
  final IfsaiState state;
  final IfsaiCubit cubit;

  const IfsaiDetailView({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    const IfsaiModel projectData = IfsaiModel();

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
              const SizedBox(height: 800),
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
          model: projectData,
          mainTitleOpacity: state.mainTitleOpacity,
          descriptionOpacity: state.descriptionOpacity,
          titleOpacity: state.titleOpacity,
          titleScale: state.titleScale,
          setScrollEnabled: (isEnabled) => cubit.setScrollEnabled(isEnabled),
        ),
      ],
    );
  }
}
