import 'package:flutter/material.dart';
import 'package:flutter_dynamic_link_app/constants/app_constants.dart';

class AppTextStyles {
  static const popularMoviesTextStyle = TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.w700,
      fontSize: 25,
      fontFamily: AppConstants.robotoTextStyleString);

  static const nameTextStyle = TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.w600, fontFamily: 'Rubik');

  static const headingTextStyle = TextStyle(
    color: Colors.black54,
    fontFamily: AppConstants.neueHassDisplayTextStyleString,
    fontSize: 16.0,
  );

  static const headingBelowTextStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstants.nunitoSansTextStyleString,
  );

  static const simpleTextStyle =
      TextStyle(color: Colors.black54, fontFamily: AppConstants.neueHassDisplayTextStyleString);
}
