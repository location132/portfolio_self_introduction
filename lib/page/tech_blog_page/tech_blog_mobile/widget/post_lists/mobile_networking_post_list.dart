import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/mobile_tech_post_title.dart';

class MobileNetworkingPostList extends StatelessWidget {
  const MobileNetworkingPostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MobileTechPostTitle(
          number: 1,
          title: '서버와 연결 (쿠키, secure_storage, dio)',
          tags: '#Server  #Cookie  #Dio  #HTTP',
          onTap: () => context.go('/schedule'),
          uploadDate: '7월 5일',
          isUpload: false,
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          number: 2,
          title: '서버 데이터 가공 연습',
          tags: '#Data Processing  #JSON  #API Response',
          onTap: () => context.go('/schedule'),
          uploadDate: '7월 7일',
          isUpload: false,
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          number: 3,
          title: '네이버 로그인',
          tags: '#Naver  #Login  #OAuth  #Social Login',
          onTap: () => context.go('/tech-blog/post/naver-login'),
          isUpload: true,
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          number: 4,
          title: '카카오 로그인',
          tags: '#Kakao  #Login  #OAuth  #Social Login',
          onTap: () => context.go('/tech-blog/post/kakao-login'),
          isUpload: true,
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          number: 5,
          title: '네트워크 이미지 사용방법 (심화 x, 기초)',
          tags: '#Network Image  #HTTP  #Image Loading',
          onTap: () => context.go('/schedule'),
          uploadDate: '7월 1일',
          isUpload: false,
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          number: 6,
          title: '카카오 맵 사용방법',
          tags: '#Kakao Map  #Map  #Location  #API',
          onTap: () => context.go('/schedule'),
          uploadDate: '7월 5일',
          isUpload: false,
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          number: 7,
          title: 'NaverMap with Flutter',
          tags: '#Naver Map  #Map Widget  #Location',
          onTap: () => context.go('/schedule'),
          uploadDate: '7월 10일',
          isUpload: false,
        ),
      ],
    );
  }
}
