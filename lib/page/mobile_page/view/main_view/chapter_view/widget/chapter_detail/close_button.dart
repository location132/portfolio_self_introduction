import 'package:flutter/material.dart';

class CloseButtonWithIcon extends StatelessWidget {
  final VoidCallback onClose;
  const CloseButtonWithIcon({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
