import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        //-----------------------------------------------------
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.10,
            color: const Color.fromARGB(255, 227, 217, 205),
          ),
        ),

        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.90,
            color: const Color.fromARGB(255, 192, 183, 170),
          ),
        ),
        //-----------------------------------------------------
      ],
    );
  }
}
