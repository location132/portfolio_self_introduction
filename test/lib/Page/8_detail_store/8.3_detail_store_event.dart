import 'package:flutter/material.dart';

class DetailStoreEvent extends StatefulWidget {
  final Map<String, dynamic> detailStoreInformation;

  const DetailStoreEvent({super.key, required this.detailStoreInformation});

  @override
  State<DetailStoreEvent> createState() => _DetailStoreEventState();
}

class _DetailStoreEventState extends State<DetailStoreEvent> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return widget.detailStoreInformation['eventMessage'] == null
        ? const Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: SizedBox.shrink(),
          )
        : Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.041,
              right: screenWidth * 0.041,
              bottom: 40,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xffdbdbdb),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'EVENT',
                    style: TextStyle(
                      color: Color(0xff6fbf8a),
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      '${widget.detailStoreInformation['eventMessage']}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xff5b5b5b),
                        fontFamily: 'PretendardSemiBold',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
  }
}
