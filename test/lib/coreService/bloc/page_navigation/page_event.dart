// lib/bloc/review_page_navigator_event.dart
abstract class ReviewPageNavigatorEvent {}

class PreviousPage extends ReviewPageNavigatorEvent {} // 메인화면에서 리뷰페이지 접속

class MarketId extends ReviewPageNavigatorEvent {} // 해당 마켓의 id

class NextPage extends ReviewPageNavigatorEvent {
  final int marketId;
  NextPage(this.marketId);
} // 리뷰페이지에서 매장 상세 페이지 접속
