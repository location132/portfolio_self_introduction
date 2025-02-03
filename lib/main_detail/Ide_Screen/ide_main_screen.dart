// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:self_introduction_flutter/%08core_service/provider.dart';
// import 'package:self_introduction_flutter/main_detail/Ide_Screen/ide_loading_detail/ide_loading_screen.dart';
// import 'package:self_introduction_flutter/main_detail/Ide_Screen/ide_loading_detail/ide_main_screen.dart';

// class IdeScreen extends StatefulWidget {
//   const IdeScreen({super.key});

//   @override
//   State<IdeScreen> createState() => _IdeScreenState();
// }

// class _IdeScreenState extends State<IdeScreen> {
//   bool _isendAni = false;

//   void isendAni() async {
//     setState(() {
//       _isendAni = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenChange = Provider.of<ScreenChange>(context);

//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.7),
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(screenHeight * 0.05),
//             bottomLeft: Radius.circular(screenHeight * 0.05)),
//       ),
//       child: Column(
//         children: [
//           SizedBox(
//             width: screenWidth * 0.35,
//             height: screenHeight * 1,
//             child: Stack(
//               children: [
//                 AnimatedOpacity(
//                   opacity: screenChange.isMainScreen ? 1.0 : 0.0,
//                   duration: const Duration(milliseconds: 720),
//                   child: _isendAni ? const IdeMainScreen() : null,
//                 ),
//                 Visibility(
//                   visible: !_isendAni,
//                   child: AnimatedOpacity(
//                     opacity: !screenChange.isMainScreen ? 1.0 : 0.0,
//                     duration: const Duration(milliseconds: 720),
//                     onEnd: isendAni,
//                     child: const IdeLoadingScreen(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
