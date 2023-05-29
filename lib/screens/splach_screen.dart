import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qurb/components/my_buttons.dart';
import 'package:qurb/components/my_text_field_widget.dart';
import 'package:qurb/components/my_text_widget.dart';
import 'package:qurb/constant.dart';
import 'package:qurb/getxcontrollers/spalach_screen_getx_controller.dart';
import 'package:qurb/getxcontrollers/theme_controller.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplachScreenGetXController>(
          init: Get.put(SplachScreenGetXController()),
          builder: (controller) => Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/Leonardo_Diffusion_Happily_married_Saudi_Muslims_straight_coup_2.jpg',
                    ),
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Image.asset(
                            'assets/images/Qurb-Splash-Screen-Logo.png',
                            fit: BoxFit.contain,
                            height: 414.07,
                            width: 253.05,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height /
                                  6.toInt()),
                          child: controller.isloading.value
                              ? LoadingAnimationWidget.inkDrop(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  size: 50,
                                )
                              : MyTextWidget(
                                  text: controller.responseModel!.message!),
                        )
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
