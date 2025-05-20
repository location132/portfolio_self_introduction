import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_state.dart';

@injectable
class MobileCubit extends Cubit<MobileState> {
  MobileCubit() : super(const MobileState());

  void test() {
    emit(state.copyWith(test: 'test'));
  }
}
