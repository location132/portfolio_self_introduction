import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/post_lists/all_posts_list.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/post_lists/architecture_post_list.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/post_lists/data_storage_post_list.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/post_lists/networking_post_list.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/post_lists/ui_animation_post_list.dart';

class TechPostList extends StatelessWidget {
  final TechBlogState state;
  const TechPostList({super.key, required this.state});

  Widget _getPostListWidget(int categoryIndex) {
    switch (categoryIndex) {
      case 0:
        return const AllPostsList();
      case 1:
        return const ArchitecturePostList();
      case 2:
        return const DataStoragePostList();
      case 3:
        return const NetworkingPostList();
      case 4:
        return const UIAnimationPostList();
      default:
        return const AllPostsList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: AnimatedOpacity(
        opacity: state.isPostListVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: WidgetAnimation(
          isStart: state.isPostListVisible,
          isReverse: !state.isPostListVisible,
          beginDy: 0.3,
          duration: 620,
          child: _getPostListWidget(state.selectedCategoryIndex),
        ),
      ),
    );
  }
}
