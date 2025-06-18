// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../page/desktop_page/desktop_cubit.dart' as _i903;
import '../../page/mobile_page/mobile_cubit.dart' as _i673;
import '../../page/project_detail_page/ifsai/ifsai_desktop/ifsai_cubit.dart'
    as _i426;
import '../../page/project_detail_page/project_detail_cubit.dart' as _i595;
import '../../page/projects_main_page/projects_main_cubit.dart' as _i68;
import '../../page/tech_blog_page/tech_blog_cubit.dart' as _i706;
import '../../service/intro_service.dart' as _i112;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i903.DesktopCubit>(() => _i903.DesktopCubit()..init());
    gh.factory<_i673.MobileCubit>(() => _i673.MobileCubit()..init());
    gh.factory<_i595.ProjectDetailCubit>(() => _i595.ProjectDetailCubit());
    gh.factory<_i68.ProjectsMainCubit>(() => _i68.ProjectsMainCubit());
    gh.factory<_i426.IfsaiCubit>(() => _i426.IfsaiCubit());
    gh.factory<_i706.TechBlogCubit>(() => _i706.TechBlogCubit()..initialize());
    gh.singleton<_i112.IntroService>(() => _i112.IntroService());
    return this;
  }
}
