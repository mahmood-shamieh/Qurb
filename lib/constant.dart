import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:qurb/components/my_text_widget.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'components/my_buttons.dart';

class Constant {
  static String apiPath = 'https://jollanar-theater.com/test/api/router.php';
  static String mediaPath = 'https://jollanar-theater.com/test/images/';
  static EdgeInsetsGeometry padding = const EdgeInsets.all(8);
  static EdgeInsetsGeometry margin = const EdgeInsets.all(8);
  static Radius radius = const Radius.circular(55);
  static getTextStyle(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      fontFamily: 'Cairo',
      color: color ?? Colors.white,
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight,
    );
  }

  static getTextStyle1(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      fontFamily: 'Bahij',
      color: color ?? Colors.white,
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight,
    );
  }

  static Gradient getGradient(
      {required BuildContext context,
      AlignmentGeometry? begin,
      AlignmentGeometry? end}) {
    return LinearGradient(
      begin: begin ?? Alignment.topRight,
      end: end ?? Alignment.bottomLeft,
      colors: [
        Theme.of(context).primaryColor,
        Theme.of(context).hoverColor,
        Theme.of(context).hintColor,
      ],
    );
  }

  static String formatDate({required DateTime date, String? format}) {
    return DateFormat(format ?? 'yyyy-MM-dd').format(date);
  }

  static getDialgBox(
      {required BuildContext context,
      String? title,
      String? body,
      List<Widget>? actions}) {
    AlertDialog alert = AlertDialog(
      title: MyTextWidget(
        text: title ?? '',
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        size: 24,
        textStyleNumber: 1,
      ),
      content: MyTextWidget(
        text: body ?? '',
        color: Theme.of(context).primaryColor,
      ),
      actions: actions ??
          [
            MyButton(
              text: 'رجوع',
              action: () => Get.back(),
            )
          ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  static getMd5String({required String input}) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static logOut() {
    try {
      final storage = GetIt.I.get<GetStorage>();
      storage.erase();
    } catch (e) {}
  }

  static String getRanomAsset() {
    switch (Random().nextInt(7)) {
      case 0:
        return 'assets/images/1.jpg';
      case 1:
        return 'assets/images/2.jpg';
      case 2:
        return 'assets/images/3.jpg';
      case 3:
        return 'assets/images/4.jpg';
      case 4:
        return 'assets/images/5.jpg';
      case 5:
        return 'assets/images/6.jpg';
      case 6:
        return 'assets/images/7.jpg';
      case 7:
        return 'assets/images/8.jpg';
      default:
        return 'assets/images/8.jpg';
    }
  }
}
