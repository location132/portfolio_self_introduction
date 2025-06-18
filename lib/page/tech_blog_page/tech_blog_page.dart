import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/tech_blog_mobile_view.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/tech_blog_desktop_view.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class TechBlogPage extends StatelessWidget {
  const TechBlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );

    return BlocProvider(
      create: (context) => di<TechBlogCubit>()..loadBlogPosts(),
      child:
          deviceType == 'mobile'
              ? const TechBlogMobileView()
              : const TechBlogDesktopView(),
    );
  }
}
