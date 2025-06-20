import 'package:intl/intl.dart';

// 이메일 검증식
RegExp emailRegExp = RegExp(
  r'^[a-zA-Z0-9._%+-]+@kku\.ac\.kr$',
  caseSensitive: false,
  multiLine: false,
);

// 날짜 변환
String formatTimeDifference(String timeStr) {
  DateFormat format = DateFormat("yyyy-MM-dd HH:mm:ss");
  DateTime givenTime = format.parse(timeStr);
  DateTime currentTime = DateTime.now();

  Duration difference = currentTime.difference(givenTime);
  int hours = difference.inHours;
  int days = difference.inDays;
  int months = days ~/ 30;
  int years = days ~/ 365;

  if (hours < 24) {
    return hours < 1 ? "방금 전" : "$hours시간 전";
  } else if (days < 7) {
    return "$days일 전";
  } else if (days < 365) {
    return months < 1 ? "1개월 전" : "$months개월 전";
  } else {
    return years < 1
        ? timeStr.toString().split(' ')[0]
        : timeStr.toString().split(' ')[0];
  }
}

// 가격 포메팅
String priceFormatting(String price) {
  String priceStr = price.toString();
  StringBuffer formattedPrice = StringBuffer();

  for (int i = 0; i < priceStr.length; i++) {
    if (i > 0 && (priceStr.length - i) % 3 == 0) {
      formattedPrice.write(',');
    }
    formattedPrice.write(priceStr[i]);
  }

  return formattedPrice.toString();
}

// 버전 문자열 비교 (1.0.0 형식)
int compareVersions(String v1, String v2) {
  final v1Parts = v1.split('.').map(int.parse).toList();
  final v2Parts = v2.split('.').map(int.parse).toList();

  // 각 부분을 순차적으로 비교
  for (int i = 0; i < 3; i++) {
    if (v1Parts[i] < v2Parts[i]) return -1;
    if (v1Parts[i] > v2Parts[i]) return 1;
  }
  return 0;
}

String formatDistance(double distanceInMeters) {
  return switch (distanceInMeters) {
    0 || 0.0 => '사용자와 매장간 거리계산을 위해 위치를 활성화해주세요.',
    double d when d < 1000 => '현재 위치로부터 ${distanceInMeters.round()}m',
    _ => '현재 위치로부터 ${(distanceInMeters / 1000).toStringAsFixed(1)}km'
  };
}
