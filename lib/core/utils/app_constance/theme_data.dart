import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_constance/styles_manager.dart';

ThemeData appThemeData() => ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.grey.shade100,
        elevation: 8,
        shadowColor: const Color.fromARGB(14, 17, 15, 15),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black87,
        size: 22,
      ),
      textTheme: TextTheme(
          headline1: getLargStyle(),
          headline2: getMediumStyle(color: Colors.grey.shade600),
          headline3: getMediumLargStyle(color: Colors.white),
          headline4: getTitleStyle(color: Colors.black),
          button: getButtonStyle(),
          headline5: getMediumStyle(color: Colors.white),
          subtitle1: getSmallStyle(color: Colors.black38),
          subtitle2: getSmallStyle(color: Colors.white)
          // bodySmall: getSmallStyle(),
          ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.black,
      ),
    );
