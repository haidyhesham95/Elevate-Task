
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/styles/size_config.dart';

import 'colors.dart';

abstract class AppStyles {
  static TextStyle styleRegular35(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 35),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular23(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 23),

      fontFamily: 'Cairo',

      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleRegular25(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 25),
      fontFamily: 'Cairo',

      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleRegular22(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle styleRegular20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle regular20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleRegular18(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle styleRegular15(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle styleRegular12(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle styleRegular14(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Cairo',
      color: Colors.blue.shade300,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.lineThrough,
    );
  }

}


double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}