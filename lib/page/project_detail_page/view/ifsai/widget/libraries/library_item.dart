import 'package:flutter/material.dart';

class LibraryItem extends StatelessWidget {
  final String library;

  const LibraryItem({super.key, required this.library});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        library,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          color: Colors.white.withOpacity(0.9),
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
