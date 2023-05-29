import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:qurb/components/my_buttons.dart';
import 'package:qurb/components/my_text_widget.dart';
import 'package:qurb/components/style_widget.dart';
import 'package:qurb/constant.dart';
import 'package:qurb/screens/profile_screen.dart';
import 'package:qurb/screens/requirement_hello_screen.dart';
import 'package:qurb/screens/requirement_on_my_hello_screen.dart';
import 'package:qurb/screens/requirement_screen.dart';
import 'package:qurb/screens/sign_in_screen.dart';
import 'package:qurb/screens/sign_up_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StyleWidget(
        items: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        MyTextWidget(
          text: 'أهلا بك في تطبيق قرب',
          size: 28,
          fontWeight: FontWeight.w600,
        ),
        MyButton(
          action: () {
            Get.to(() => const ProfileScreen());
          },
          text: 'الصفحة الشخصية',
          width: 300,
        ),
        MyButton(
          action: () {
            Get.to(() => RequirementHelloScreen());
          },
          text: 'المتطلبات',
          width: 300,
        ),
        MyButton(
          action: () {
            Get.to(() => RequirementOnMeHelloScreen());
          },
          text: 'الاستبيان الشخصي',
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
                        
