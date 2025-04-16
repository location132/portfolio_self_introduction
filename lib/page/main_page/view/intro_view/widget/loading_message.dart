import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class LoadingMessage extends StatefulWidget {
  final MainPageState state;
  final void Function(TickerProvider vsync, {String message})?
      initializeAnimations;

  const LoadingMessage({
    super.key,
    required this.state,
    this.initializeAnimations,
  });

  @override
  State<LoadingMessage> createState() => _LoadingMessageState();
}

class _LoadingMessageState extends State<LoadingMessage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text('시작하기에 앞서 Rive애니메이션, 그리고 화면의 높이 등.'),
        // Text('여러가지 준비 작업을 진행하고 있습니다.'),
        // SizedBox(height: 20),
      ],
    );
  }
}
