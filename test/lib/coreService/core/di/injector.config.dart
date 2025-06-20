// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../Page/11_shopping_cart/pages/shopping_option_page/shopping_option_cubit.dart'
    as _i27;
import '../../../Page/11_shopping_cart/pages/shopping_page/shopping_cart_cubit.dart'
    as _i26;
import '../../../Page/12_naver_map/dio/naver_map_dio.dart' as _i10;
import '../../../Page/12_naver_map/page/NaverMapApp_cubit.dart' as _i32;
import '../../../Page/12_naver_map/service/naver_map_overlay.dart' as _i11;
import '../../../Page/12_naver_map/service/naver_map_service.dart' as _i25;
import '../../../Page/14_affiliated_store/dio/affiliated_dio.dart' as _i3;
import '../../../Page/14_affiliated_store/pages/affiliated_page/affiliated_store_cubit.dart'
    as _i31;
import '../../../Page/1_start_page/%08service/start_reomte_service.dart'
    as _i30;
import '../../../Page/1_start_page/page/start_cubit.dart' as _i33;
import '../../../repository/affiliated_store_api/affiliated_store_remote_repository.dart'
    as _i15;
import '../../../repository/affiliated_store_api/affiliated_store_remote_service.dart'
    as _i16;
import '../../../repository/affiliated_store_api/affiliated_store_remote_source.dart'
    as _i4;
import '../../../repository/cart_api/cart_remote_repository.dart' as _i18;
import '../../../repository/cart_api/cart_reomte_service.dart' as _i19;
import '../../../repository/cart_api/cart_reomte_source.dart' as _i5;
import '../../../repository/menu_option_api/menu_option_remote_repository.dart'
    as _i20;
import '../../../repository/menu_option_api/menu_option_remote_service.dart'
    as _i21;
import '../../../repository/menu_option_api/menu_option_remote_source.dart'
    as _i8;
import '../../../repository/naver_map_api/naver_map_local_source.dart' as _i23;
import '../../../repository/naver_map_api/naver_map_remote_repository.dart'
    as _i24;
import '../../../repository/naver_map_api/naver_map_remote_source.dart' as _i12;
import '../../../repository/start_api/start_remote_local.dart' as _i28;
import '../../../repository/start_api/start_remote_repository.dart' as _i29;
import '../../../repository/start_api/start_reomte_source.dart' as _i14;
import '../../isar/app_version/app_version_service.dart' as _i17;
import '../../isar/isar_init_service.dart' as _i6;
import '../../isar/naver_map/naver_map_category_service.dart' as _i9;
import '../../isar/naver_map/naver_map_data_service.dart' as _i22;
import '../../isar/naver_map/naver_map_version_service.dart' as _i13;
import '../service/location_service.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AffiliatedDio>(() => _i3.AffiliatedDio());
    gh.singleton<_i4.AffiliatedStoreRemoteSource>(
        () => _i4.AffiliatedStoreRemoteSource(gh<_i3.AffiliatedDio>()));
    gh.singleton<_i5.CartRemoteSource>(() => _i5.CartRemoteSource());
    gh.singleton<_i6.IsarInitService>(() => _i6.IsarInitService());
    gh.singleton<_i7.LocationService>(() => _i7.LocationService());
    gh.singleton<_i8.MenuOptionRemoteSource>(
        () => _i8.MenuOptionRemoteSource());
    gh.singleton<_i9.NaverMapCategoryService>(
        () => _i9.NaverMapCategoryService(gh<_i6.IsarInitService>()));
    gh.singleton<_i10.NaverMapDio>(() => _i10.NaverMapDio());
    gh.singleton<_i11.NaverMapOverlayService>(
        () => _i11.NaverMapOverlayService());
    gh.singleton<_i12.NaverMapRemoteSource>(
        () => _i12.NaverMapRemoteSource(gh<_i10.NaverMapDio>()));
    gh.singleton<_i13.NaverMapVersionService>(
        () => _i13.NaverMapVersionService(gh<_i6.IsarInitService>()));
    gh.singleton<_i14.StartRemoteSource>(() => _i14.StartRemoteSource());
    gh.singleton<_i15.AffiliatedStoreRemoteRepository>(() =>
        _i15.AffiliatedStoreRemoteRepository(
            gh<_i4.AffiliatedStoreRemoteSource>()));
    gh.singleton<_i16.AffiliatedStoreRemoteService>(() =>
        _i16.AffiliatedStoreRemoteService(
            gh<_i15.AffiliatedStoreRemoteRepository>()));
    gh.singleton<_i17.AppVersionService>(
        () => _i17.AppVersionService(gh<_i6.IsarInitService>()));
    gh.singleton<_i18.CartRemoteRepository>(
        () => _i18.CartRemoteRepository(gh<_i5.CartRemoteSource>()));
    gh.singleton<_i19.CartRemoteService>(
        () => _i19.CartRemoteService(gh<_i18.CartRemoteRepository>()));
    gh.singleton<_i20.MenuOptionRemoteRepository>(() =>
        _i20.MenuOptionRemoteRepository(gh<_i8.MenuOptionRemoteSource>()));
    gh.singleton<_i21.MenuOptionRemoteService>(() =>
        _i21.MenuOptionRemoteService(gh<_i20.MenuOptionRemoteRepository>()));
    gh.singleton<_i22.NaverMapDataService>(() => _i22.NaverMapDataService(
          gh<_i6.IsarInitService>(),
          gh<_i13.NaverMapVersionService>(),
          gh<_i9.NaverMapCategoryService>(),
        ));
    gh.singleton<_i23.NaverMapLocalSource>(() => _i23.NaverMapLocalSource(
          gh<_i22.NaverMapDataService>(),
          gh<_i9.NaverMapCategoryService>(),
        ));
    gh.singleton<_i24.NaverMapRemoteRepository>(
        () => _i24.NaverMapRemoteRepository(
              gh<_i12.NaverMapRemoteSource>(),
              gh<_i23.NaverMapLocalSource>(),
            ));
    gh.singleton<_i25.NaverMapService>(
        () => _i25.NaverMapService(gh<_i24.NaverMapRemoteRepository>()));
    gh.factory<_i26.ShoppingCartCubit>(
        () => _i26.ShoppingCartCubit(gh<_i19.CartRemoteService>()));
    gh.factory<_i27.ShoppingOptionCubit>(() => _i27.ShoppingOptionCubit(
          gh<_i19.CartRemoteService>(),
          gh<_i21.MenuOptionRemoteService>(),
        ));
    gh.singleton<_i28.StartRemoteLocal>(() => _i28.StartRemoteLocal(
          gh<_i17.AppVersionService>(),
          gh<_i13.NaverMapVersionService>(),
        ));
    gh.singleton<_i29.StartRemoteRepository>(() => _i29.StartRemoteRepository(
          gh<_i14.StartRemoteSource>(),
          gh<_i28.StartRemoteLocal>(),
        ));
    gh.singleton<_i30.StartRemoteService>(() => _i30.StartRemoteService(
          gh<_i29.StartRemoteRepository>(),
          gh<_i24.NaverMapRemoteRepository>(),
        ));
    gh.factory<_i31.AffiliatedStoreCubit>(() =>
        _i31.AffiliatedStoreCubit(gh<_i16.AffiliatedStoreRemoteService>())
          ..init());
    gh.factory<_i32.NaverMapCubit>(() => _i32.NaverMapCubit(
          gh<_i25.NaverMapService>(),
          gh<_i7.LocationService>(),
          gh<_i11.NaverMapOverlayService>(),
        ));
    gh.factory<_i33.StartCubit>(
        () => _i33.StartCubit(gh<_i30.StartRemoteService>()));
    return this;
  }
}
