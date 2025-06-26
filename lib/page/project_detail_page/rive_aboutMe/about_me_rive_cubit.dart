import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'about_me_rive_state.dart';

@injectable
class RiveAboutMeCubit extends Cubit<RiveAboutMeState> {
  RiveAboutMeCubit() : super(const RiveAboutMeState());

  void setMenuClicked(bool isClicked) {
    emit(state.copyWith(isMenuClicked: isClicked));
  }

  void toggleMenu() {
    if (isClosed) return;
    emit(state.copyWith(isMenuClicked: !state.isMenuClicked));
  }
}
