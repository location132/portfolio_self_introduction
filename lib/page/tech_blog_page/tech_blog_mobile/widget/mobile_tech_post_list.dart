import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/post_lists/mobile_all_posts_list.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/post_lists/mobile_architecture_post_list.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/post_lists/mobile_data_storage_post_list.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/post_lists/mobile_networking_post_list.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/post_lists/mobile_ui_animation_post_list.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';

class MobileTechPostList extends StatelessWidget {
  final TechBlogState state;
  const MobileTechPostList({super.key, required this.state});

  Widget _getPostListWidget(int categoryIndex) {
    switch (categoryIndex) {
      case 0:
        return const MobileAllPostsList();
      case 1:
        return const MobileArchitecturePostList();
      case 2:
        return const MobileDataStoragePostList();
      case 3:
        return const MobileNetworkingPostList();
      case 4:
        return const MobileUIAnimationPostList();
      default:
        return const MobileAllPostsList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: _getPostListWidget(state.selectedCategoryIndex),
    );
  }
}
