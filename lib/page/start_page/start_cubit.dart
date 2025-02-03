import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/start_page/start_state.dart';

@injectable
class StartPageCubit extends Cubit<StartPageState> {
  StartPageCubit() : super(const StartPageState());
}
