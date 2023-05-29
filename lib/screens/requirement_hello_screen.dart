import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qurb/components/action_button.dart';
import 'package:qurb/components/my_text_widget.dart';
import 'package:qurb/components/style_widget.dart';
import 'package:qurb/screens/requirement_screen.dart';

class RequirementHelloScreen extends StatelessWidget {
  const RequirementHelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StyleWidget(
        items: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyTextWidget(
          text: 'الآن سوف تقوم باختيار \n مواصفات \n شريكك المستقبلي',
          fontWeight: FontWeight.bold,
          size: 22,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ActionButton(
            action: () {
              Get.back();
              Get.to(() => const RequirementScreen());
            },
            text: 'متابعة',
            width: MediaQuery.of(context).size.width / 1.4,
          ),
        )
      ],
    ));
  }
}
