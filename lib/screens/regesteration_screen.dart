import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:qurb/components/action_button.dart';
import 'package:qurb/components/my_buttons.dart';
import 'package:qurb/components/my_text_widget.dart';
import 'package:qurb/components/style_widget.dart';
import 'package:qurb/constant.dart';
import 'package:qurb/screens/sign_in_screen.dart';
import 'package:qurb/screens/sign_up_screen.dart';

class RegesterationScreen extends StatelessWidget {
  const RegesterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StyleWidget(
        items: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 13),
          child: MyTextWidget(
            text: 'أهلا بك في تطبيق قُرب',
            size: 28,
            fontWeight: FontWeight.w600,
            textStyleNumber: 1,
          ),
        ),
        MyButton(
          action: () {
            Get.to(() => SignInScreen());
          },
          text: 'تسجيل الدخول',
          width: 300,
        ),
        MyButton(
          action: () {
            Get.to(() => SignUpScreen());
          },
          text: 'إنشاء حساب ',
          width: 300,
        ),
        ActionButton(
          action: () {
            // Get.to(() => SignUpScreen());
          },
          text: 'عن التطبيق',
          width: 300,
        )
      ],
    ));
  }
}
//  BackdropFilter(
//                         filter: ImageFilter.blur(
//                           sigmaX: 5,
//                           sigmaY: 5,
//                         ),
                        
