import 'package:flutter/material.dart';

import 'dimensions.dart';
//* ##################### App TextStyles ######################

mixin AppTextStyles {
  static String? fontFamily;
  static final header = TextStyle(
      fontSize: 22.0, fontWeight: FontWeight.bold, fontFamily: fontFamily);
  static final title = TextStyle(
      fontSize: D.sizeXLarge,
      fontWeight: FontWeight.w400,
      fontFamily: fontFamily);

  static final info = TextStyle(
      fontSize: D.sizeMedium,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily);

  static final body = TextStyle(
      fontSize: D.sizeLarge,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily);
  static final error = TextStyle(
      fontSize: D.sizeMedium,
      fontWeight: FontWeight.bold,
      color: Colors.red,
      fontFamily: fontFamily);

  static final textButton = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, fontFamily: fontFamily);
}
