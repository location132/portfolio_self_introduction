import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/main_detail/Ide_Screen/ide_loading_detail/ide_loading_screen.dart';

class IdeScreen extends StatefulWidget {
  const IdeScreen({super.key});

  @override
  State<IdeScreen> createState() => _IdeScreenState();
}

class _IdeScreenState extends State<IdeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenHeight * 0.05),
            bottomLeft: Radius.circular(screenHeight * 0.05)),
      ),
      child: Column(
        children: [
          SizedBox(
            width: screenWidth * 0.35,
            height: screenHeight * 1,
            child: const IdeLoadingScreen(),
          ),
        ],
      ),
    );
  }
}
