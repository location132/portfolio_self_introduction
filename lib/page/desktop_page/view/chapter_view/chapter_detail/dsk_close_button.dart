import 'package:flutter/material.dart';

class DskCloseButtonWithIcon extends StatelessWidget {
  final VoidCallback onClose;
  const DskCloseButtonWithIcon({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          const Spacer(),
          GestureDetector(
            onTap: onClose,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.close, color: Colors.white, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
