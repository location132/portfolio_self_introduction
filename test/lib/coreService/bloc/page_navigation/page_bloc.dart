// lib/bloc/review_page_navigator_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/coreService/bloc/page_navigation/page_event.dart';
import 'package:my_dream/coreService/bloc/page_navigation/page_state.dart';

class ReviewPageNavigatorBloc
    extends Bloc<ReviewPageNavigatorEvent, ReviewPageNavigatorState> {
  ReviewPageNavigatorBloc() : super(ReviewPageNavigatorState(false, 0)) {
    // PreviousPage 이벤트에 대한 처리
    on<PreviousPage>((event, emit) {
      emit(ReviewPageNavigatorState(
          false, 0)); // 이전 페이지로 이동 시, currentPage를 false로 설정
    });

    // NextPage 이벤트에 대한 처리 (다음 페이지로 이동할 때)
    on<NextPage>((event, emit) {
      emit(ReviewPageNavigatorState(
          true, event.marketId)); // 다음 페이지로 이동 시, currentPage를 true로 설정
    });
  }
}
