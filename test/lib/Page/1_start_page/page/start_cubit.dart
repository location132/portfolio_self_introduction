import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dream/Page/1_start_page/page/start_state.dart';
import 'package:my_dream/Page/1_start_page/%08service/start_reomte_service.dart';

@injectable
class StartCubit extends Cubit<StartState> {
  final StartRemoteService _service;

  StartCubit(this._service) : super(const StartState());

  Future<void> init() async {
    await checkServerConnection();
    await checkServerMaintenance();
    if (state.screenState != ScreenState.error) {
      await getVersionWithIsar();
    }
  }

  // 서버 연결확인과 버전 체크(앱 버전, 네이버)
  Future<void> checkServerConnection() async {
    emit(state.copyWith(screenState: ScreenState.loading));
    final response = await _service.serverConnectionWithDio();
    emit(state.copyWith(ifsai: response));
  }

  // 서버 점검
  Future<void> checkServerMaintenance() async {
    final ifsai = state.ifsai;
    if (ifsai == null || !ifsai.isServerConnected) {
      emit(state.copyWith(screenState: ScreenState.error));
    } else {
      await _service.getNaverMapVersionWithIsar(ifsai);
    }
  }

  // 서버와 앱 버전 비교
  Future<void> getVersionWithIsar() async {
    final bool result = await _service.getVersionWithIsar(state.ifsai!);
    emit(state.copyWith(isNeedUpdateApp: result));

    if (state.isNeedUpdateApp) {
      emit(state.copyWith(screenState: ScreenState.update));
    } else {
      emit(state.copyWith(screenState: ScreenState.loaded));
    }
  }
}
