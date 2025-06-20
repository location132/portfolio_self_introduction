import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: 'Pretendard',
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: BorderSide(color: Color(0xffdbdbdb), width: 1),
        ),
        elevation: 0,
        color: Colors.white,
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Pretendard',
        ),
      ),
    );
  }

  static PopupMenuThemeData get myPagePopupMenuTheme {
    return PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
        side: BorderSide(color: Color(0xffdbdbdb), width: 1),
      ),
      elevation: 6,
      color: Colors.white,
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: 'Pretendard',
      ),
    );
  }
}