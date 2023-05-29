import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:qurb/components/action_button.dart';
import 'package:qurb/components/my_buttons.dart';
import 'package:qurb/components/my_text_field_widget.dart';
import 'package:qurb/components/my_text_widget.dart';
import 'package:qurb/components/style_widget_2.dart';
import 'package:qurb/constant.dart';

class ResetPasswordScreen extends StatefulWidget {
  bool is_selected = false;
  ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return StyleWidget2(
      userSecoundTitle: false,
      header: const SizedBox(),
      item: Container(
        margin: const EdgeInsets.only(top: 80),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: MyTextWidget(
                text:
                    'لاستعادة كلمة المرور يرجى إدخال البريد الإلكتروني في الحقل ادناه',
                color: Theme.of(context).primaryColor,
                size: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            MyTextFieldWidget(
              icon: Icons.mail,
              hint: 'البريد الإلكتروني',
              controller: TextEditingController(),
            ),
            ActionButton(
              text: 'استعادة كلمة المرور',
            )
          ],
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: MyTextWidget(
              text: 'استعادة لكمة المرور',
              size: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
//  BackdropFilter(
//                         filter: ImageFilter.blur(
//                           sigmaX: 5,
//                           sigmaY: 5,
//                         ),
