import 'package:flutter/material.dart';
import 'package:tabibuk/configs/themes/dimensions.dart';

// ignore_for_file: avoid_classes_with_only_static_members
///
/// Contains useful functions to reduce enigma_boilerplate code
///
class UiHelper {
  //* <---------------------------------------------------------  Border Radius

  // Custom Methods
  static BorderRadius allRoundedEdges([double radius = D.defaultRadius]) {
    return BorderRadius.all(Radius.circular(radius));
  }

  static BorderRadius topRoundedEdges([double radius = D.defaultRadius]) {
    return BorderRadius.only(
        topLeft: Radius.circular(radius), topRight: Radius.circular(radius));
  }

  static BorderRadius bottomRoundedEdges([double radius = D.defaultRadius]) {
    return BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius));
  }

  static BorderRadius rightRoundedEdges([double radius = D.defaultRadius]) {
    return BorderRadius.only(
        bottomRight: Radius.circular(radius),
        topRight: Radius.circular(radius));
  }

  static BorderRadius leftRoundedEdges([double radius = D.defaultRadius]) {
    return BorderRadius.only(
        topLeft: Radius.circular(radius), bottomLeft: Radius.circular(radius));
  }

  static BorderRadius topRightRoundedEdge([double radius = D.defaultRadius]) {
    return BorderRadius.only(topRight: Radius.circular(radius));
  }

  static BorderRadius topLeftRoundedEdge([double radius = D.defaultRadius]) {
    return BorderRadius.only(
      topLeft: Radius.circular(radius),
    );
  }

  static BorderRadius bottomLeftRoundedEdge([double radius = D.defaultRadius]) {
    return BorderRadius.only(
      bottomLeft: Radius.circular(radius),
    );
  }

  static BorderRadius bottomRightRoundedEdge(
      [double radius = D.defaultRadius]) {
    return BorderRadius.only(
      bottomRight: Radius.circular(radius),
    );
  }

  //* <------------------------------------------------ Notification & Messages

  // Show SnackBar Anywhere

  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  static void showSnackBar({required String content, Color? color}) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
      backgroundColor: color,
    ));
  }

  //* <----------------------------------------- Functions & Extensions
  // Post Frame Callbacks
  static void postBuild(void Function(Duration) callback) {
    WidgetsBinding.instance.addPostFrameCallback(callback);
  }
}
