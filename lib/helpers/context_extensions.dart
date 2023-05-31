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
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double heightR(double value) => MediaQuery.of(this).size.height * value;
  double widthR(double value) => MediaQuery.of(this).size.width * value;

  bool get isSmallDevice {
    final size = MediaQuery.of(this).size;
    return size.width <= 320 || size.height <= 568;
  }

  bool get isMediumDevice {
    final size = MediaQuery.of(this).size;
    return (size.width > 320 && size.width <= 375) ||
        (size.height > 568 && size.height <= 667);
  }

  bool get isLargeDevice {
    final size = MediaQuery.of(this).size;
    return (size.width > 375 && size.width <= 768) ||
        (size.height > 667 && size.height <= 1024);
  }

  bool get isExtraLargeDevice {
    final size = MediaQuery.of(this).size;
    return (size.width > 768 && size.width <= 1080) ||
        (size.height > 1024 && size.height <= 1920);
  }
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
