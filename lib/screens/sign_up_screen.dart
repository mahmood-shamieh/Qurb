import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qurb/components/my_buttons.dart';
import 'package:qurb/components/my_text_field_widget.dart';
import 'package:qurb/components/my_text_widget.dart';
import 'package:qurb/components/style_widget_2.dart';
import 'package:qurb/constant.dart';
import 'package:qurb/getxcontrollers/sign_up_screen_getx_controller.dart';
import 'package:qurb/screens/home_screen.dart';
import 'package:qurb/screens/regesteration_screen.dart';
import 'package:qurb/screens/reset_password_screen.dart';
import 'package:qurb/screens/sign_up_screen.dart';

import '../components/action_button.dart';
import '../components/bottom_sheet_date_time_picker.dart';

class SignUpScreen extends StatefulWidget {
  bool is_selected = false;
  SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpScrenGetXController>(
        init: Get.put(SignUpScrenGetXController()),
        builder: (controller) => StyleWidget2(
            userSecoundTitle: true,
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
                          text: 'إنشاء حساب',
                          size: 14,
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
                              top: 4, bottom: 4, right: 6, left: 4),
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
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyTextFieldWidget(
                          icon: Icons.mail,
                          hint: 'البريد الإلكتروني * ',
                          controller: controller.email,
                        ),
                        MyTextFieldWidget(
                          icon: Icons.person,
                          hint: 'الاسم الكامل * ',
                          controller: controller.fullname,
                        ),
                        MyTextFieldWidget(
                          icon: Icons.phone,
                          hint: 'رقم الموبايل* ',
                          controller: controller.mobile,
                          textInputType: TextInputType.phone,
                        ),
                        MyTextFieldWidget(
                          icon: Icons.lock,
                          hint: 'كلمة المرور * ',
                          password: true,
                          controller: controller.password,
                        ),
                        MyTextFieldWidget(
                          icon: Icons.lock,
                          hint: "تأكيد كلمة المرور * ",
                          password: true,
                          controller: controller.confrimPassword,
                        ),
                        MyButton(
                          height: 90,
                          action: () async {
                            DatePicker.showDatePicker(context,
                                theme: DatePickerTheme(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  cancelStyle: Constant.getTextStyle(
                                      fontWeight: FontWeight.normal),
                                  doneStyle: Constant.getTextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  itemStyle: Constant.getTextStyle(
                                      fontWeight: FontWeight.normal),
                                ),
                                showTitleActions: true,
                                minTime: DateTime(1970, 1, 1),
                                maxTime: DateTime.now(), onConfirm: (date) {
                              controller.birth = date;
                              FocusScope.of(context).unfocus();
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.ar);
                            // DatePicker.showDatePicker(
                            //   context,
                            //   minDateTime: DateTime(1970),
                            //   maxDateTime: DateTime.now(),
                            //   initialDateTime: DateTime.now(),
                            //   dateFormat: 'yyyy-MM-dd',
                            // );
                          },
                          text: 'تاريخ الميلاد (أجباري)',
                        ),
                        MyButton(
                          height: 90,
                          action: () async {
                            Get.bottomSheet(
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Constant.radius,
                                        topRight: Constant.radius)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        final XFile? photo = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera);
                                        if (photo != null) {
                                          controller.setProfileImage(
                                              path: photo.path);
                                        }
                                        Get.back();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.camera,
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color!,
                                              size: 80,
                                            ),
                                            MyTextWidget(text: 'الكاميرا')
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        FilePickerResult? result =
                                            await FilePicker.platform.pickFiles(
                                                type: FileType.image);

                                        if (result != null) {
                                          controller.setProfileImage(
                                              path: result.files[0].path!);
                                        }
                                        Get.back();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.image_search,
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color!,
                                              size: 80,
                                            ),
                                            MyTextWidget(text: 'المعرض')
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                            // FilePickerResult? result = await FilePicker.platform
                            //     .pickFiles(type: FileType.image);
                          },
                          text: 'إختر صورة (إختياري)',
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: MyTextWidget(
                                  text: 'الجنس',
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.selectMale(),
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          20,
                                      decoration: BoxDecoration(
                                        color: controller.isMale.value
                                            ? Theme.of(context).iconTheme.color!
                                            : Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.all(
                                          Constant.radius,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: MyTextWidget(
                                          text: 'ذكر',
                                          fontWeight: controller.isMale.value
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => controller.selectFemale(),
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          20,
                                      decoration: BoxDecoration(
                                        color: !controller.isMale.value
                                            ? Theme.of(context).iconTheme.color!
                                            : Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.all(
                                          Constant.radius,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: MyTextWidget(
                                          text: 'أُنثى',
                                          fontWeight: !controller.isMale.value
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 120,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: (MediaQuery.of(context).size.height / 2) - 100),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.75),
                        borderRadius: BorderRadius.only(
                            topLeft: Constant.radius,
                            topRight: Constant.radius)),
                    child: ActionButton(
                      // width: MediaQuery.of(context).size.width - 30,
                      action: () {
                        controller.signUp();
                      },
                      text: 'إنشاء حساب',
                    ),
                  )
                ],
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/Pattern (1).png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          child: controller.profileImage == null
                              ? Image.asset(
                                  'assets/images/${controller.isMale.value ? 'Person-(male).png' : 'Person-(Female).png'}',
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  controller.profileImage!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
