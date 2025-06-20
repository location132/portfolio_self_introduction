import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/List/widget/repository_widget.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/List/widget/post_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

class RepositoryPatternPage extends StatefulWidget {
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  const RepositoryPatternPage({
    super.key,
    required this.isFocused,
    this.scrollController,
  });

  @override
  State<RepositoryPatternPage> createState() => _RepositoryPatternPageState();
}

class _RepositoryPatternPageState extends State<RepositoryPatternPage> {
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
      cubit.setScrollTargetOffset(position.dy - 200);
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
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  PostHeader(
                    title: 'Repository Pattern',
                    tags: const [
                      '#Repository Pattern',
                      '#Data Layer',
                      '#Remote Repository',
                      '#Local Repository',
                      '#Data Source',
                      '#레포지토리 패턴',
                      '#데이터 계층',
                      '#Clean Architecture',
                    ],
                    content:
                        '데이터를 어떻게 관리할까?\n'
                        '로컬 데이터베이스에서 가져올지, API에서 받아올지, 캐시된 데이터를 사용할지...\n\n'
                        '처음에는 이런 데이터 소스들을 직접 View나 ViewModel에서 처리하곤 했습니다.\n'
                        '하지만 프로젝트가 커지고 복잡해질수록 "데이터 로직이 여기저기 흩어져 있어서 유지보수가 힘들다"는 것을 깨달았죠.\n\n'
                        'Repository Pattern은 이런 문제를 해결해주는 강력한 패턴입니다.\n'
                        '데이터 소스를 추상화하여 비즈니스 로직에서는 "어떤 데이터가 필요한지"만 알면 되고,\n'
                        '"어디서 어떻게 가져오는지"는 Repository가 알아서 처리하게 됩니다.\n\n'
                        'Clean Architecture와 함께 사용하면서 데이터 계층을 체계적으로 관리할 수 있게 되었고,\n'
                        '테스트하기도 훨씬 쉬워졌습니다.\n\n'
                        '제가 Flutter 프로젝트에서 Repository Pattern을 어떻게 구현하고 활용하는지 공유해보겠습니다.',
                    isBackgroundColor: state.isBackgroundColorWhite,
                  ),
                  const SizedBox(height: 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RepositoryPattern(
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        codeExampleSectionKey: _codeExampleSectionKey,
                      ),
                      const SizedBox(height: 150),
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
