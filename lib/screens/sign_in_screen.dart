import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:qurb/components/my_buttons.dart';
import 'package:qurb/components/my_text_field_widget.dart';
import 'package:qurb/components/my_text_widget.dart';
import 'package:qurb/components/style_widget_2.dart';
import 'package:qurb/constant.dart';
import 'package:qurb/getxcontrollers/sign_in_screen_getx_controller.dart';
import 'package:qurb/screens/home_screen.dart';
import 'package:qurb/screens/regesteration_screen.dart';
import 'package:qurb/screens/reset_password_screen.dart';
import 'package:qurb/screens/sign_up_screen.dart';

import '../components/action_button.dart';

class SignInScreen extends StatefulWidget {
  bool is_selected = false;
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInPageGetXController>(
        init: Get.put(SignInPageGetXController()),
        builder: (controller) {
          return StyleWidget2(
            userSecoundTitle: false,
            isloading: controller.isLoading.value,
            header: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Constant.radius),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 30,
                        sigmaY: 30,
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 4, bottom: 4, right: 24, left: 24),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.all(Constant.radius),
                        ),
                        child: MyTextWidget(
                          text: 'تسجيل الدخول',
                          size: 14,
                          textStyleNumber: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.offAll(() => RegesterationScreen()),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Constant.radius),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 30,
                          sigmaY: 30,
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 4, right: 4, left: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.all(Constant.radius),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            item: Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTextFieldWidget(
                    icon: Icons.mail,
                    hint: 'البريد الإلكتروني',
                    controller: controller.email,
                  ),
                  MyTextFieldWidget(
                    icon: Icons.lock,
                    hint: "كلمة المرور",
                    controller: controller.password,
                    password: true,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Get.to(() => ResetPasswordScreen()),
                          child: MyTextWidget(
                            text: 'نسيت كلمة المرور ؟',
                            color: Theme.of(context).cardColor,
                            size: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ActionButton(
                    action: () {
                      controller.signIn();
                    },
                    text: 'تسجيل الدخول',
                  ),
                  InkWell(
                    onTap: () => Get.to(() => SignUpScreen()),
                    child: MyTextWidget(
                      text: "إذا لم يكم لديك حساب قم بإنشاء حساب جديد من هنا ",
                      color: Theme.of(context).primaryColor,
                      size: 16,
                      fontWeight: FontWeight.w600,
                    ),
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
                    text: 'أهلاً بك مجدداً',
                    size: 24,
                    textStyleNumber: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
  // GestureDetector(
  //   onTap: () {
  //     setState(() {
  //       widget.is_selected = !widget.is_selected;
  //     });
  //   },
  //   child: Row(
  //     children: [
  //       MyTextWidget(
  //         text: 'تذكرني',
  //         color: Theme.of(context).primaryColor,
  //         size: 14,
  //       ),
  //       const SizedBox(
  //         width: 8,
  //       ),
  //       Container(
  //         width: 28,
  //         height: 28,
  //         decoration: BoxDecoration(
  //           shape: BoxShape.rectangle,
  //           borderRadius: BorderRadius.circular(9),
  //           border: Border.all(
  //               width: 2,
  //               color: Theme.of(context).primaryColor),
  //         ),
  //         child: widget.is_selected
  //             ? Center(
  //                 child: Icon(
  //                   Icons.check,
  //                   color:
  //                       Theme.of(context).iconTheme.color,
  //                 ),
  //               )
  //             : SizedBox(),
  //       ),
  //     ],
  //   ),
  // )
