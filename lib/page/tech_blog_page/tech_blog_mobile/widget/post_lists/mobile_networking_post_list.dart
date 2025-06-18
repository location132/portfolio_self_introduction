import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/mobile_tech_post_title.dart';

class MobileNetworkingPostList extends StatelessWidget {
  const MobileNetworkingPostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MobileTechPostTitle(
          number: 15,
          title: '서버와 연결 (쿠키, secure_storage, dio)',
          tags: '#Server  #Cookie  #Dio  #HTTP',
        ),
        SizedBox(height: 30.h),
        const MobileTechPostTitle(
          number: 16,
          title: '서버 데이터 가공 연습',
          tags: '#Data Processing  #JSON  #API Response',
        ),
        SizedBox(height: 30.h),
        const MobileTechPostTitle(
          number: 17,
          title: '네이버 로그인',
          tags: '#Naver  #Login  #OAuth  #Social Login',
        ),
        SizedBox(height: 30.h),
        const MobileTechPostTitle(
          number: 18,
          title: '카카오 로그인',
          tags: '#Kakao  #Login  #OAuth  #Social Login',
        ),
        SizedBox(height: 30.h),
        const MobileTechPostTitle(
          number: 19,
          title: '네트워크 이미지 사용방법 (심화 x, 기초)',
          tags: '#Network Image  #HTTP  #Image Loading',
        ),
        SizedBox(height: 30.h),
        const MobileTechPostTitle(
          number: 20,
          title: '카카오 맵 사용방법',
          tags: '#Kakao Map  #Map  #Location  #API',
        ),
        SizedBox(height: 30.h),
        const MobileTechPostTitle(
          number: 21,
          title: 'NaverMap with Flutter',
          tags: '#Naver Map  #Map Widget  #Location',
        ),
      ],
    );
  }
}
