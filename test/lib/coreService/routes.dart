import 'package:flutter/material.dart';
import 'package:my_dream/Page/10_my_page/10.15_my_page_setting.dart';
import 'package:my_dream/Page/10_my_page/10.5_my_coupon.dart';
import 'package:my_dream/Page/10_my_page/10.6_my_wishlist.dart';
import 'package:my_dream/Page/10_my_page/10_my_page.dart';
import 'package:my_dream/Page/10_my_page/10.2_my_page_notice_detail.dart';
import 'package:my_dream/Page/10_my_page/10.1_my_page_notice.dart';
import 'package:my_dream/Page/10_my_page/10.3_my_page_event.dart';
import 'package:my_dream/Page/10_my_page/10.7_my_page_orderlist.dart';
import 'package:my_dream/Page/10_my_page/10.8_my_page_orderlist_detail.dart';
import 'package:my_dream/Page/10_my_page/10.9_my_page_review.dart';
import 'package:my_dream/Page/11_shopping_cart/pages/shopping_page/shopping_cart_page.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_page.dart';
import 'package:my_dream/Page/13_join_us/13.2_join_us_request_page.dart';
import 'package:my_dream/Page/14_affiliated_store/pages/affiliated_page/affiliated_store_page.dart';
import 'package:my_dream/Page/15_invite_page/15.1_invite_detail_page.dart';
import 'package:my_dream/Page/3_student_email_page/3.6_students_success_screen.dart';
import 'package:my_dream/Page/3_student_email_page/3_student_identity_detail.dart';
import 'package:my_dream/Page/2_login_page/2_login.dart';
import 'package:my_dream/Page/4_main_page/main_detail_page/0_detail_join_us.dart';
import 'package:my_dream/Page/4_main_page/main_detail_page/2_detail_top_12.dart';
import 'package:my_dream/Page/4_main_page/4_main_screen.dart';
import 'package:my_dream/Page/1_start_page/page/start_page.dart';
import 'package:my_dream/Page/4_main_page/main_detail_page/1_detail_new_store.dart';
import 'package:my_dream/Page/4_main_page/main_detail_page/3.1_detail_category_attraction.dart';
import 'package:my_dream/Page/4_main_page/main_detail_page/3.2_detail_category_eating.dart';
import 'package:my_dream/Page/8_detail_store/8_detail_store.dart';
import 'package:my_dream/Page/7_partnership_request_page/2.partnership_formpage/7.2_partnership_request_form.dart';
import 'package:my_dream/Page/7_partnership_request_page/3.partnership_formpage_detail/7.3_partnership_search.dart';
import 'package:my_dream/Page/9_store_review/9.1_store_review_container.dart';
import 'package:my_dream/Page/9_store_review/9.7_store_review_photo_review_detail.dart';
import 'package:my_dream/Page/11_shopping_cart/pages/shopping_option_page/shopping_option_page.dart';
import 'package:my_dream/Page/10_my_page/10.14_my_page_myinfo.dart';
import 'package:my_dream/Page/10_my_page/10.11_my_page_review_write_back.dart';
import 'package:my_dream/Page/10_my_page/10.12_my_page_review_fix_back.dart';
import 'package:my_dream/Page/10_my_page/10.13_my_page_review_detail.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/LoginPage': (context) => const LoginPage(), // 로그인 회원가입 페이지
  '/StudentIdentityCheck': (context) =>
      const StudentIdentityCheck(), // 학생 인증 페이지
  '/StudentsSuccessScreen': (context) =>
      const StudentsSuccessScreen(), // 학생인증 완료 페이지
  '/MainScreen': (context) => const MainScreen(), // 메인화면 페이지
  '/DetailTop12Store': (context) => const DetailTop12(), //메인화면 top12 스토어 전체 보기
  '/DetailNewStore': (context) => const DetailNewStore(), // 메인화면 신규스토어 전체보기
  '/DetailCategoryEating': (context) =>
      const DetailCategoryEating(), // 메인화면 식사 카테고리 전체보기
  '/DetailCategoryAttraction': (context) =>
      const DetailCategoryAttraction(), // 메인화면 문화 카테고리 전체보기 & 관광명소 전체보기
  '/AffiliatedStorePage': (context) =>
      const AffiliatedStorePage(), // 메인화면 제휴 카테고리 전체보기
  '/StartPage': (context) => const StartPage(), // 로그인 전 페이지

  '/PartnershipRequestForm': (context) =>
      const PartnershipRequestForm(), // 파트너쉽 요청 글쓰기 페이지
  '/PartnershipSearch': (context) => const PartnershipSearch(), // 파트너쉽 검색 페이지
  '/StoreDetail': (context) => const StoreDetail(), // 매장 상세페이지
  '/StoreReviewContainer': (context) =>
      const StoreReviewContainer(), // 매장 리뷰 페이지
  '/MyPage': (context) => const MyPage(), // 마이페이지
  '/MyPageNoticeDetail': (context) =>
      const MyPageNoticeDetail(), // 마이페이지 공지사항 상세보기
  '/MyPageNotice': (context) => const MyPageNotice(), // 마이페이지 공지사항
  '/MyPageEvent': (context) => const MyPageEvent(), // 마이페이지 이벤트
  '/MyPageSetting': (context) => const MyPageSetting(), // 마이페이지 설정
  '/StoreReviewPhotoReviewDetail': (context) =>
      const StoreReviewPhotoReviewDetail(), // 매장 리뷰 중 포토리뷰 모아보기 페이지
  '/MyCoupon': (context) => const MyCoupon(), // 마이페이지 (쿠폰)
  '/MyWishlist': (context) => const MyWishlist(), // 마이페이지 (위시리스트)
  '/MyPageOrderlist': (context) => const MyPageOrderlist(), // 마이페이지 (주문내역)
  '/MyPageOrderlistDetail': (context) =>
      const MyPageOrderlistDetail(), // 마이페이지 (주문내역) 상세
  '/MyShoppingCart': (context) => const MyShoppingCartPage(), // 마이페이지 (주문내역) 상세
  '/MyPageReview': (context) => const MyPageReview(), // 마이페이지 (리뷰관리)
  '/MyShoppingCartOption': (context) => MyShoppingCartOptionPage(
        index: ModalRoute.of(context)!.settings.arguments as int,
      ), // 장바구니 옵션
  '/MyPageMyInfo': (context) => const MyPageMyInfo(), // 마이페이지 (내 정보 관리)
  '/NaverMapAppPage': (context) => const NaverMapAppPage(), // 네이버 지도 페이지
  '/DetailJoinUs': (context) => const DetailJoinUs(), // 메인화면 같이하고싶은게 있다면? 상세보기
  '/MyPageReviewWriteBack': (context) =>
      const MyPageReviewWriteBack(), // 마이페이지 리뷰쓰기
  '/MyPageReviewFixBack': (context) =>
      const MyPageReviewFixBack(), // 마이페이지 리뷰수정
  '/MyPageReviewDetail': (context) => const MyPageReviewDetail(), // 마이페이지 리뷰상세
  '/JoinUsRequestPage': (context) => const JoinUsRequestPage(), // 같이해요 글쓰기 페이지
  'MyInvitePage': (context) => const MyInvitePage(), // 초대하기 페이지
};
