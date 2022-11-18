import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// created by YunusEmre
/// on 26-Oct-22

class AppThemeData {
  static ThemeData get getMainLightThemeData {
    return ThemeData(
      useMaterial3: true,
      primaryColor: const Color(0xFFFFB74D),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0XFF29B6F6),
        elevation: 5,
        selectedIconTheme: IconThemeData(
          color: Color(0XFFFFB74D),
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
      ),
      appBarTheme: getAppBarThemeData,
    );
  }

  static AppBarTheme get getAppBarThemeData {
    return const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}
