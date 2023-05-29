import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:qurb/constant.dart';

class MyTextWidget extends StatelessWidget {
  String text;
  double? size;
  Color? color;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  double? textStyleNumber;
  MyTextWidget(
      {super.key,
      this.textStyleNumber,
      required this.text,
      this.size,
      this.color,
      this.fontWeight,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        text: text,
        style: (textStyleNumber ?? 0) == 1
            ? Constant.getTextStyle1(
                fontSize: size, fontWeight: fontWeight, color: color)
            : Constant.getTextStyle(
                fontSize: size, fontWeight: fontWeight, color: color),
      ),
    );
  }
}
