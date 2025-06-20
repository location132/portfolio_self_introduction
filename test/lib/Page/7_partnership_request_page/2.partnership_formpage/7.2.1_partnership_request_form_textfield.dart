// 업체명, 상세주소, 전화번호를 위한 textformfield //

import 'package:flutter/material.dart';

class NewWidget extends StatefulWidget {
  final String title;
  final String initialValue;
  final bool dataStatus;
  const NewWidget(
      {super.key,
      required this.title,
      required this.initialValue,
      required this.dataStatus});

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(NewWidget oldWidget) {
    print(12312312312);
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      _controller.text = widget.initialValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Text(
          '${widget.title} :',
          style: const TextStyle(
            color: Color(0xff8e8e8e),
            fontFamily: 'Pretendard',
          ),
        ),
        const Spacer(),
        SizedBox(
          width: screenWidth * 0.675,
          height: 30,
          child: TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color:
                      widget.dataStatus ? const Color(0xffdbdbdb) : Colors.red,
                  width: 0.9,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: Color(0xffdbdbdb),
                  width: 1,
                ),
              ),
            ),
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Pretendard',
            ),
          ),
        ),
      ],
    );
  }
}
