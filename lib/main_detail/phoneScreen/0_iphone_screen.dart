// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:self_introduction_flutter/%08core_service/provider.dart';
// import 'package:self_introduction_flutter/main_detail/phoneScreen/1_iphone_StartScreen.dart';
// import 'package:self_introduction_flutter/main_detail/phoneScreen/2_iphone_main.dart';

// class PhoneScreen extends StatefulWidget {
//   const PhoneScreen({super.key});

//   @override
//   State<PhoneScreen> createState() => _PhoneScreenState();
// }

// class _PhoneScreenState extends State<PhoneScreen> {
//   bool _isStartScreen = false;
//   double _opacity = 0.0;
//   double cornerRadius = 67.4333;
//   double cornerRadius1 = 60.4333;
//   bool _isendAni = false;

//   void isendAni() async {
//     setState(() {
//       _isendAni = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenChange = Provider.of<ScreenChange>(context);
//     double screenHeight = MediaQuery.of(context).size.height;

//     if (screenChange.isStartSimulator) {
//       if (!_isStartScreen) {
//         setState(() {
//           _isStartScreen = true;
//           _opacity = 0.0;
//         });
//         Future.delayed(const Duration(seconds: 2), () {
//           setState(() {
//             _opacity = 1.0;
//           });
//         });
//       }
//     }

//     return AnimatedOpacity(
//       opacity: _opacity,
//       duration: const Duration(milliseconds: 1500),
//       child: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 height: screenHeight * 0.9,
//                 width: screenHeight * 0.43,
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius:
//                       BorderRadius.all(Radius.circular(screenHeight * 0.054)),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(screenHeight * 0.01),
//                   child: SizedBox(
//                     height: screenHeight * 0.87,
//                     width: screenHeight * 0.416,
//                     child: Stack(
//                       children: [
//                         AnimatedOpacity(
//                           opacity: screenChange.isMainScreen ? 1.0 : 0.0,
//                           duration: const Duration(milliseconds: 720),
//                           child: const PhoneMainScreen(),
//                         ),
//                         Visibility(
//                           visible: !_isendAni,
//                           child: AnimatedOpacity(
//                             opacity: !screenChange.isMainScreen ? 1.0 : 0.0,
//                             duration: const Duration(milliseconds: 720),
//                             onEnd: isendAni,
//                             child: const PhoneStartScreen(),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
