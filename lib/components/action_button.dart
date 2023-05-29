import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constant.dart';

class ActionButton extends StatelessWidget {
  double? width;
  Function()? action;
  String text;
  bool? active;
  ActionButton(
      {super.key, this.width, this.action, required this.text, this.active});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: action,
        child: Container(
          padding: Constant.padding,
          margin: Constant.margin,
          width: width,
          height: 65,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Constant.radius),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  spreadRadius: 0.1,
                  blurRadius: 3,
                  blurStyle: BlurStyle.outer,
                  // offset: const Offset(2, 6),
                ),
              ],
              gradient: active ?? true
                  ? Constant.getGradient(context: context)
                  : LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.grey,
                        Colors.grey,
                        Colors.grey,
                      ],
                    ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Constant.radius),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      text,
                      style: Constant.getTextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                  Positioned(
                    top: -55,
                    right: -55,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/images/Pattern (1).png',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -55,
                    left: -55,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/images/Pattern (1).png',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
