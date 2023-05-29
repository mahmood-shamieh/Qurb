import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qurb/components/style_widget_2.dart';
import 'package:qurb/getxcontrollers/profile_screen_getx_controller.dart';
import 'package:qurb/screens/regesteration_screen.dart';

import '../components/action_button.dart';
import '../components/my_buttons.dart';
import '../components/my_text_field_widget.dart';
import '../components/my_text_widget.dart';
import '../constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenGetXController>(
        init: Get.put(ProfileScreenGetXController()),
        builder: (controller) {
          return StyleWidget2(
            isloading: controller.isLoading.value,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: MyTextWidget(
                            text: 'البريد الإلكتروني : ',
                            color: Theme.of(context).primaryColor,
                            textAlign: TextAlign.right,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        MyTextFieldWidget(
                          icon: Icons.mail,
                          hint: 'البريد الإلكتروني * ',
                          controller: controller.email,
                          onchange: (value) => controller.onChangeTextField(),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: MyTextWidget(
                            text: 'الاسم الكامل : ',
                            color: Theme.of(context).primaryColor,
                            textAlign: TextAlign.right,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        MyTextFieldWidget(
                          icon: Icons.person,
                          hint: 'الاسم الكامل * ',
                          controller: controller.fullname,
                          onchange: (value) => controller.onChangeTextField(),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: MyTextWidget(
                            text: 'رقم الموبايل : ',
                            color: Theme.of(context).primaryColor,
                            textAlign: TextAlign.right,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        MyTextFieldWidget(
                          icon: Icons.phone,
                          hint: 'رقم الموبايل* ',
                          controller: controller.mobile,
                          textInputType: TextInputType.phone,
                          onchange: (value) => controller.onChangeTextField(),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: MyTextWidget(
                            text: 'كلمة المرور : ',
                            color: Theme.of(context).primaryColor,
                            textAlign: TextAlign.right,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        MyTextFieldWidget(
                          icon: Icons.lock,
                          hint: 'كلمة المرور * ',
                          password: true,
                          controller: controller.password,
                          onchange: (p0) {
                            if (p0.isEmpty) {
                              controller.changeHappend.value = false;
                              controller.update();
                            } else {
                              controller.changeHappend.value = true;
                              controller.update();
                            }
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: MyTextWidget(
                            text: 'تأكيد كلمة المرور : ',
                            color: Theme.of(context).primaryColor,
                            textAlign: TextAlign.right,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        MyTextFieldWidget(
                          icon: Icons.lock,
                          hint: "تأكيد كلمة المرور * ",
                          password: true,
                          controller: controller.confrimPassword,
                          onchange: (p0) {
                            if (p0.isEmpty) {
                              controller.changeHappend.value = false;
                              controller.update();
                            } else {
                              controller.changeHappend.value = true;
                              controller.update();
                            }
                          },
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
                                currentTime: controller.birth ?? DateTime.now(),
                                minTime: DateTime(1970, 1, 1),
                                maxTime: DateTime.now(),
                                onConfirm: (date) {
                                  controller.birth = date;
                                  FocusScope.of(context).unfocus();
                                },
                                onCancel: () =>
                                    FocusScope.of(context).unfocus(),
                                onChanged: (time) =>
                                    FocusScope.of(context).unfocus(),
                                locale: LocaleType.ar);
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
                                        FocusScope.of(context).unfocus();
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
                                        FocusScope.of(context).unfocus();
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
                        MyButton(
                          color: Colors.black87,
                          height: 90,
                          action: () {
                            Constant.logOut();
                            Get.offAll(() => const RegesterationScreen());
                          },
                          text: 'تسجيل الخروج',
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
                      active: controller.changeHappend.value,
                      // width: MediaQuery.of(context).size.width - 30,
                      action: () {
                        if (controller.changeHappend.value) {
                          controller.updateProfileData();
                        } else {}
                      },
                      text: 'تعديل البيانات',
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
                          child: controller.haveImage
                              ? Image.network(
                                  Constant.mediaPath +'users/'+ controller.imagepath,
                                  fit: BoxFit.cover,
                                )
                              : controller.profileImage == null
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
            ),
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
                          text: 'تعديل البيانات',
                          size: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.back(),
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
            userSecoundTitle: true,
          );
        });
  }
}
