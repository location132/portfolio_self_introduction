import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F8F8),
      child: Padding(
        padding: EdgeInsets.only(top: 15.sh, bottom: 15.sh),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(width: 11.sw),
            Image.asset(
              'assets/Images/flutter_bird.png',
              scale: 25,
            ),
            const NavItem(title: TextConstants.topNavBar1),
            const NavItem(title: TextConstants.topNavBar2),
            const NavItem(title: TextConstants.topNavBar3),
            const NavItem(title: TextConstants.topNavBar4),
            const NavItem(title: TextConstants.topNavBar5),
            const NavItem(title: TextConstants.topNavBar6),
            const NavItem(title: TextConstants.topNavBar7),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  const NavItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.sw),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            debugPrint("$title 클릭됨");
          },
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
