import 'package:flutter/material.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';

class InviteContainer extends StatefulWidget {
  final String condition;
  final String writer;
  final String store;
  final String date;

  const InviteContainer(
      {super.key,
      required this.condition,
      required this.writer,
      required this.store,
      required this.date});

  @override
  State<InviteContainer> createState() => _InviteContainerState();
}

class _InviteContainerState extends State<InviteContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.sw,
      height: 226.sh,
      decoration: BoxDecoration(
        //Color(0xfff5f5f5)
        color:
            widget.condition == 'end' ? const Color(0xfff5f5f5) : Colors.white,
        border: Border.all(color: const Color(0xffe0e0e0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sw),
        child: Column(
          children: [
            Container(
              width: 331.sw,
              height: 69.5.sh,
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xffe0e0e0)))),
              child: Row(
                children: [
                  Center(
                    child: Container(
                      width: 40.sw,
                      height: 40.sh,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.pink),
                    ),
                  ),
                  SizedBox(width: 10.sw),
                  Center(
                      child: Row(
                    children: [
                      Text(
                        widget.writer,
                        style: const TextStyle(
                          fontFamily: 'PretendardSemiBold',
                        ),
                      ),
                      const Text(' 님이 초대장을 보냈어요!'),
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
                width: 331.sw,
                height: 154.5.sh,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.sw),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 70.sw,
                            height: 70.sh,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          SizedBox(width: 10.sw),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.store,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'PretendardSemiBold',
                                ),
                              ),
                              Text(
                                widget.date,
                                style: const TextStyle(
                                    fontFamily: 'Pretendard',
                                    color: Color(0xff616161)),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 17.sh),
                      Row(
                        children: [
                          Container(
                            width: 159.5.sw,
                            height: 37.sh,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xfff5f5f5),
                                border: widget.condition == 'end'
                                    ? Border.all(
                                        color: const Color(0xffe0e0e0),
                                        width: 2)
                                    : null),
                            child: const Center(
                              child: Text(
                                '초대장 보기',
                                style: TextStyle(fontFamily: 'Pretendard'),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.sw),
                          Container(
                            width: 159.5.sw,
                            height: 37.sh,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: widget.condition == 'end' ||
                                        widget.condition == 'myInvitation'
                                    ? Colors.grey
                                    : const Color(0xFF6FBF8A),
                                border: Border.all(
                                    color: const Color(0xffbdbdbd), width: 2)),
                            child: Center(
                              child: Text(
                                widget.condition == 'end' ? '모임완료' : '수락하기',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'PretendardSemiBold',
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
