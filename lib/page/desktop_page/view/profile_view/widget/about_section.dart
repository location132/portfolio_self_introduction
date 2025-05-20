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
    return Container(
      width: 280.sw,
      padding: EdgeInsets.all(20.sw),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22.sw,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 16.sh),
          ...sectionInfo
              .map((info) => Padding(
                    padding: EdgeInsets.only(bottom: 12.sh),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_right,
                          size: 18.sw,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.7),
                        ),
                        SizedBox(width: 8.sw),
                        Expanded(
                          child: Text(
                            info,
                            style: TextStyle(
                              fontSize: 16.sw,
                              height: 1.5,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
