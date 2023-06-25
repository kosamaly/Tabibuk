import 'package:flutter/material.dart';

import 'package:intl/intl.dart' as intl;

extension ContextEx on BuildContext {
  // MediaQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // Request UnFocus
  void unFocusRequest() {
    final currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }
}

extension UiExtension on BuildContext {
  // Widgets Extensions
  void showAlertDialog(Widget widget) =>
      showDialog(context: this, builder: (context) => widget);
}

extension DeviceSizeExtension on BuildContext {
  //* Dimensions Extensions
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  Size get size => MediaQuery.sizeOf(this);

  double heightR(double value) => MediaQuery.sizeOf(this).height * value;
  double widthR(double value) => MediaQuery.sizeOf(this).width * value;

  bool get isSmallDevice {
    return size.width <= 320 || size.height <= 568;
  }

  bool get isMediumDevice =>
      (size.width > 320 && size.width <= 375) ||
      (size.height > 568 && size.height <= 667);

  bool get isLargeDevice =>
      (size.width > 375 && size.width <= 768) ||
      (size.height > 667 && size.height <= 1024);

  bool get isExtraLargeDevice =>
      (size.width > 768 && size.width <= 1080) ||
      (size.height > 1024 && size.height <= 1920);
}

extension LocaleExtension on BuildContext {
  // Locale Extensions
  bool get isRTL =>
      intl.Bidi.isRtlLanguage(Localizations.localeOf(this).languageCode);
}

extension ThemeExtension on BuildContext {
  // Theme Extensions
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
}
