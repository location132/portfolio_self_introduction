import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'approach_item_widget.dart';

class WrongApproachListWidget extends StatelessWidget {
  final bool isMobile;
  const WrongApproachListWidget({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            '잘못된 접근 방법',
            style: TextStyle(
              fontSize: isMobile ? 24.sp : 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[100],
              height: 1.4,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 30.h : 30),
        ApproachItemWidget(
          isMobile: isMobile,
          number: '1',
          title: '애니메이션 사용',
          description:
              'Flutter의 AnimatedOpacity 위젯을 사용해 연관검색어 리스트의 표시를 부드럽게 전환하려했습니다. 위젯의 투명도를 관리하는 전환 효과는 번쩍임 효과를 없애지 못하였습니다.',
          reasonTitle: '1.1. 잘못된 접근방법인 이유',
          reason:
              '서버에서 값을 새로 받아왔다면 state의 생명주기 setState를 통해 새로고침하는 순간 애니메이션보다 화면의 새로고침되는 번쩍임이 우선순위였기 때문이였습니다.',
        ),
        SizedBox(height: isMobile ? 30.h : 30),
        ApproachItemWidget(
          isMobile: isMobile,
          number: '2',
          title: 'Debouncing 적용',
          description:
              '사용자 입력에 지연시간을 두어 불필요한 API 호출을 줄이려 했습니다. Timer를 사용해 300ms 지연 후 검색 요청을 보내도록 구현했지만, 화면 번쩍임 문제는 여전히 발생했습니다.',
          reasonTitle: '2.1. 잘못된 접근방법인 이유',
          reason:
              'API 호출 횟수는 줄였지만, 한글 조합형 입력 시 발생하는 각각의 onChange 이벤트마다 여전히 setState가 호출되어 UI가 재구성되는 근본적인 문제를 해결하지 못했습니다.',
        ),
        SizedBox(height: isMobile ? 30.h : 30),
        ApproachItemWidget(
          isMobile: isMobile,
          number: '3',
          title: 'Loading 상태 추가',
          description:
              '검색 중임을 나타내는 CircularProgressIndicator를 추가하여 사용자에게 로딩 상태를 보여주려 했습니다. 검색 결과가 도착하기 전까지 로딩 스피너를 표시하는 방식으로 접근했습니다.',
          reasonTitle: '3.1. 잘못된 접근방법인 이유',
          reason:
              '로딩 상태 표시는 사용자 경험을 개선할 수 있지만, 한글 입력 시 매번 로딩과 결과가 반복되어 오히려 더 산만한 UI가 되었고, 화면 번쩍임의 근본 원인은 해결되지 않았습니다.',
        ),
      ],
    );
  }
}
