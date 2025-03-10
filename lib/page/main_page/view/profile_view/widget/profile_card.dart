import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 20,
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(80),
              topRight: Radius.circular(80),
              bottomLeft: Radius.circular(80),
              bottomRight: Radius.circular(260),
            ),
          ),
          height: 630,
          width: 320,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 30),
              const Text(
                ProfileCardTextConstants.profileCardName,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                ProfileCardTextConstants.profileCardEngName,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                ProfileCardTextConstants.profileCardBirth,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                  letterSpacing: 1.5,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                ProfileCardTextConstants.profileCardPhone,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                  letterSpacing: 1.5,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                ProfileCardTextConstants.profileCardEmail,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                  letterSpacing: 1.0,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
