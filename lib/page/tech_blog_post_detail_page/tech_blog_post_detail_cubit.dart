import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

@injectable
class TechBlogPostDetailCubit extends Cubit<TechBlogPostDetailState> {
  TechBlogPostDetailCubit() : super(const TechBlogPostDetailState());

  // 메뉴 변경
  void toggleMenu() {
    emit(state.copyWith(isMenuClicked: !state.isMenuClicked));
  }
}
