// 이 코드는 진짜 모르겠다.. 인공지능이 만든 코드들.. 내 실력 아님

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
  // 서브스크롤 영역에 있는지 여부를 추적하는 변수
  bool _isPointerOverSubScroll = false;

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

    // 서브스크롤 컨트롤러에 리스너 추가
    final subController = widget.state.scrollModel.subScrollController;
    if (subController != null) {
      subController.addListener(_checkSubScrollPosition);
    }
  }

  @override
  void dispose() {
    // 리스너 제거
    final subController = widget.state.scrollModel.subScrollController;
    if (subController != null) {
      subController.removeListener(_checkSubScrollPosition);
    }
    super.dispose();
  }

  // 서브스크롤의 위치를 체크하는 리스너 함수
  void _checkSubScrollPosition() {
    // 필요에 따라 구현
  }

  // 포인터가 서브스크롤 영역에 들어왔을 때 호출
  void _onPointerEnterSubScroll(bool isOver) {
    setState(() {
      _isPointerOverSubScroll = isOver;
    });
  }

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? Listener(
          onPointerSignal: (PointerSignalEvent event) {
            if (!widget.state.scrollModel.isScrollEnabled) {
              return;
            }

            // 서브스크롤 영역인지 확인
            final subController = widget.state.scrollModel.subScrollController;
            if (_isPointerOverSubScroll &&
                subController != null &&
                subController.hasClients) {
              // 서브스크롤이 가능한 상태인지 확인
              final isAtEdge =
                  subController.position.pixels <= 0 ||
                  subController.position.pixels >=
                      subController.position.maxScrollExtent;

              // 서브스크롤이 최상단이나 최하단이 아니면 메인 스크롤은 동작하지 않음
              if (!isAtEdge && event is PointerScrollEvent) {
                // 서브스크롤 처리는 각 서브스크롤 위젯에서 처리되도록 함
                return;
              }
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
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              // 스크롤 알림을 통해 서브스크롤 영역에서 스크롤 중인지 확인
              if (notification.depth > 0) {
                // depth > 0는 중첩된 스크롤을 의미
                _onPointerEnterSubScroll(true);

                // 서브스크롤이 끝에 도달했는지 확인
                if (notification is ScrollEndNotification) {
                  final metrics = notification.metrics;
                  if (metrics.pixels <= 0 ||
                      metrics.pixels >= metrics.maxScrollExtent) {
                    _onPointerEnterSubScroll(false);
                  }
                }
              }
              return false; // 이벤트를 계속 전파
            },
            child: widget.child,
          ),
        )
        : widget.child;
  }
}
