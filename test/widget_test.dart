// import 'package:flutter/material.dart';
// import 'package:self_introduction_flutter/constants/text_constants.dart';
// import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
// import 'package:self_introduction_flutter/page/main_page/main_state.dart';
// import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/%08right_title.dart';
// import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/my_story.dart';
// import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Info_with_mystory.dart';
// import 'package:self_introduction_flutter/page/main_page/widgets/title_text.dart';

// class ProfileView extends StatefulWidget {
//   final MainPageState state;
//   final Function(String) onScroll;
//   const ProfileView({super.key, required this.state, required this.onScroll});

//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfileView> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 0.8,
//       child: Stack(
//         children: [
//           Row(
//             children: [
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.90,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const TitleText(
//                       title: TitleTextConstants.title2,
//                       subTitle: TitleTextConstants.subTitle2,
//                       description: '  ${TitleTextConstants.description2}',
//                       color: Colors.white,
//                     ),
//                     const Spacer(),
//                     // 1번 페이지
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(left: 130.sw, right: 130.sw),
//                           child: SeminarImage(
//                             pageStart:
//                                 widget.state.profileModel.scrollCount == 1,
//                           ),
//                         ),
//                         //-------------------------------
//                         Padding(
//                           padding: EdgeInsets.only(
//                               left: 130.sw, right: 130.sw, bottom: 70.sh),
//                         ),
//                         //-------------------------------
//                         Padding(
//                             padding: EdgeInsets.only(
//                                 left: 130.sw, right: 130.sw, bottom: 70.sh),
//                             child: MyStory(
//                                 isThirdPageInit:
//                                     widget.state.profileModel.scrollCount ==
//                                         3)),
//                       ],
//                     ),
//                     const Spacer(),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 10),
//               RightTitle(state: widget.state),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }








// //-----------------------------
// /*
// import 'package:flutter/material.dart';
// import 'dart:ui';

// import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

// class SeminarImage extends StatefulWidget {
//   final bool pageStart;
//   const SeminarImage({super.key, required this.pageStart});

//   @override
//   State<SeminarImage> createState() => _SeminarImageState();
// }

// class _SeminarImageState extends State<SeminarImage>
//     with TickerProviderStateMixin {
//   late AnimationController _animationController;
//   late AnimationController _imageAnimationControllerWithLeft;
//   late AnimationController _imageAnimationControllerWithRight;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _leftSlide;
//   late Animation<Offset> _rightSlide;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     );

//     _imageAnimationControllerWithLeft = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     );

//     _imageAnimationControllerWithRight = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     );

//     _fadeAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );

//     _leftSlide = Tween<Offset>(
//       begin: const Offset(-1.2, -3.5),
//       end: const Offset(0, -2.0),
//     ).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );

//     _rightSlide = Tween<Offset>(
//       begin: const Offset(1.2, -3.5),
//       end: const Offset(0, -2.0),
//     ).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//   }

//   void startAnimation() async {
//     _animationController.forward();
//     await Future.delayed(const Duration(milliseconds: 420));
//     _imageAnimationControllerWithLeft.forward();
//     await Future.delayed(const Duration(milliseconds: 420));
//     _imageAnimationControllerWithRight.forward();
//   }

//   void stopAnimation() {
//     _animationController.reverse();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     _imageAnimationControllerWithLeft.dispose();
//     _imageAnimationControllerWithRight.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.pageStart) {
//       startAnimation();
//     }
//     return AnimatedOpacity(
//       opacity: widget.pageStart ? 1.0 : 0.0,
//       duration: const Duration(milliseconds: 420),
//       child: Padding(
//         padding: EdgeInsets.only(left: 130.sw, right: 130.sw),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Positioned(
//               top: 0,
//               left: 30,
//               bottom: 0,
//               child: Text('왼쪽 테스트', style: TextStyle(color: Colors.white)),
//             ),
//             SlideTransition(
//               position: _leftSlide,
//               child: FadeTransition(
//                 opacity: _fadeAnimation,
//                 child: const Text(
//                   '테스트 입니당 제목',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             SlideTransition(
//               position: _rightSlide,
//               child: FadeTransition(
//                 opacity: _fadeAnimation,
//                 child: const Text(
//                   '테스트 입니당 내용',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 0,
//               right: 30,
//               bottom: 0,
//               child: Text('오른쪽 테스트', style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// */