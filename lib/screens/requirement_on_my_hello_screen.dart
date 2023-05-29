import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qurb/components/action_button.dart';
import 'package:qurb/components/my_text_widget.dart';
import 'package:qurb/components/style_widget.dart';
import 'package:qurb/screens/requirement_on_me_screen.dart';
import 'package:qurb/screens/requirement_screen.dart';

class RequirementOnMeHelloScreen extends StatelessWidget {
  const RequirementOnMeHelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StyleWidget(
        items: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyTextWidget(
          text: 'الآن سوف تقوم بالإجابة \n عن مواصفاتك',
          fontWeight: FontWeight.bold,
          size: 22,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ActionButton(
            action: () {
              Get.back();
              Get.to(() => const RequirementOnMeScreen());
            },
            text: 'متابعة',
            width: MediaQuery.of(context).size.width / 1.4,
          ),
        )
      ],
    ));
  }
}
