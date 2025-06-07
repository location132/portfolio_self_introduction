import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:js' as js;

import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';

class SlowScrollPhysics extends StatefulWidget {
  final DesktopState state;
  final Widget child;
  const SlowScrollPhysics({
    super.key,
    required this.state,
    required this.child,
  });

  @override
  State<SlowScrollPhysics> createState() => _SlowScrollPhysicsState();
}

class _SlowScrollPhysicsState extends State<SlowScrollPhysics> {
  /* 
  TODO: 이 코드는 내가 도저히 실패해서 클로드가 만든코드, 꼭 확인하고 노션에 정리하기
  
  코드 스타일을 보면 알겠지만 조금 더 정확하게 하기 위해서 작성

    - Override initState을 제외한 모든 코드는 내가 만든 코드임으로 추가 확인 필요없고 바로 다시 구현은 가능함
    - 다시 공부하고 노션에 정리학 내용은 아래의 
   
     @override
    void initState() {
    super.initState();
    if (kIsWeb) {
      js.context.callMethod('eval', [
        '''
        document.addEventListener('wheel', function(event) {
          event.preventDefault();
        }, { passive: false });
      '''
      ]);
    }
  }
  
  이 코드임 
  - 노션에 정리 끝나고 주석 삭제 예정
  - 주석 작성 일자 4월 24일 오전 11시 14분 
  
  */
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      js.context.callMethod('eval', [
        '''
        document.addEventListener('wheel', function(event) {
          event.preventDefault();
        }, { passive: false });
      ''',
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? Listener(
          onPointerSignal: (PointerSignalEvent event) {
            if (!widget.state.scrollModel.isScrollEnabled) {
              return;
            }

            // SlowScrollPhysics가 비활성화되어 있으면 스크롤 처리하지 않음
            if (widget.state.detailMeModel.isSlowScrollDisabled) {
              return;
            }

            if (event is PointerScrollEvent) {
              final controller = widget.state.scrollModel.scrollController;
              if (controller != null && controller.hasClients) {
                final current = controller.position.pixels;
                final max = controller.position.maxScrollExtent;
                final min = controller.position.minScrollExtent;

                final target = (current + event.scrollDelta.dy * 0.4).clamp(
                  min,
                  max,
                );

                controller.jumpTo(target);
              }
            }
          },
          child: widget.child,
        )
        : widget.child;
  }
}
