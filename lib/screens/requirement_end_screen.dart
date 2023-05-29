import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qurb/components/action_button.dart';
import 'package:qurb/components/my_text_widget.dart';
import 'package:qurb/components/style_widget.dart';
import 'package:qurb/getxcontrollers/requirement_on_my_screen_getx_controller.dart';
import 'package:qurb/screens/home_screen.dart';
import 'package:qurb/screens/requirement_screen.dart';

import '../getxcontrollers/requirement_screen_getx_controller.dart';

class RequirementEndScreen extends StatelessWidget {
  const RequirementEndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StyleWidget(
        items: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyTextWidget(
          text: 'تم تسجبل المعلومات المدخلة \n سيتم التواصل معك بأقرب وقت',
          fontWeight: FontWeight.bold,
          size: 22,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ActionButton(
            action: () {
              Get.offAll(() => HomeScreen());
            },
            text: 'خروج',
            width: MediaQuery.of(context).size.width / 1.4,
          ),
        )
      ],
    ));
  }
}
