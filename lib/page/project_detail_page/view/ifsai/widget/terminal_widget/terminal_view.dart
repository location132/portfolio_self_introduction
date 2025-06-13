import 'package:flutter/material.dart';

class TerminalWidget extends StatelessWidget {
  const TerminalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 800,
      height: 300,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'jung_won@Lee-Jungwon-MacBookAir IFSAI-Flutter % find lib -name \'*.dart\' | xargs wc -l',
            style: TextStyle(
              fontFamily: 'monospace',
              color: Colors.greenAccent,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                '클릭',
                style: TextStyle(fontFamily: 'monospace', color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
