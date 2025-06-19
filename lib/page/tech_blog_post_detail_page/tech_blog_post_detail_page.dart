import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_mobile/tech_blog_post_detail_mobile_view.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/tech_blog_post_detail_desktop_view.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class TechBlogPostDetailPage extends StatelessWidget {
  final String postSlug;

  const TechBlogPostDetailPage({super.key, required this.postSlug});

  @override
  Widget build(BuildContext context) {
    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );

    return BlocProvider(
      create: (context) => di<TechBlogPostDetailCubit>(),
      child:
          deviceType == 'mobile'
              ? TechBlogPostDetailMobileView(postSlug: postSlug)
              : TechBlogPostDetailDesktopView(postSlug: postSlug),
    );
  }
}
