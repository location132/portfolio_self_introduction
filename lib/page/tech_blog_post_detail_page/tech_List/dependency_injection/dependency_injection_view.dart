import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/dependency_injection/dependency_injection_concept.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/dependency_injection/dependency_injection_content.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/my_story_start.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

class DependencyInjectionView extends StatefulWidget {
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  final bool isMobile;
  const DependencyInjectionView({
    super.key,
    required this.isFocused,
    this.scrollController,
    required this.isMobile,
  });

  @override
  State<DependencyInjectionView> createState() =>
      _DependencyInjectionViewState();
}

class _DependencyInjectionViewState extends State<DependencyInjectionView> {
  final GlobalKey _codeExampleSectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // widget.isFocused(true);
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
                  // 개념
                  DependencyInjectionConcept(
                    state: state,
                    isMobile: widget.isMobile,
                    isFocused: (isFocused) {
                      widget.isFocused(isFocused);
                    },
                    scrollController: widget.scrollController,
                  ),
                  // 개념과, 내이야기 사이
                  SizedBox(height: widget.isMobile ? 80.h : 80),
                  MyStoryStart(
                    isMobile: widget.isMobile,
                    isBackgroundColorWhite: state.isBackgroundColorWhite,
                    codeExampleSectionKey: _codeExampleSectionKey,
                    textTitle: '4개의 이야기로 구성된 의존성 주입 포스팅',
                    textSubTitle:
                        '프로젝트들에 적용하며 경험한 실제 이야기 입니다!\n\n\n\n                      자동 의존성 주입 구현하기\n                      4계층 아키텍쳐 + DI 설계\n                      다중 의존성과 순환 의존성\n총 5만줄 넘는 프로젝트를 구현하며 경험한 실제 효과',
                    textSubTitle2:
                        '\n\n\n\n소개하는 코드는 제 프로젝트들과 포트폴리오 웹에서 실제로 구현한 코드입니다.',
                  ),
                  SizedBox(height: widget.isMobile ? 30.h : 30),
                  // 내 코드와 이야기 시작
                  DependencyInjectionContent(
                    state: state,
                    isMobile: widget.isMobile,
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
