import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

class AboutSection extends StatelessWidget {
  final String title;
  final List<String> sectionInfo;
  const AboutSection({
    super.key,
    required this.title,
    required this.sectionInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            constraints: BoxConstraints(maxHeight: 180.sh, maxWidth: 300),
            child: ListView.builder(
              itemCount: sectionInfo.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 180.sh / sectionInfo.length,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '•',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            sectionInfo[index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
