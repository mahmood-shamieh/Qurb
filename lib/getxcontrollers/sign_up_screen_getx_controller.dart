import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qurb/constant.dart';
import 'package:qurb/controllers/sign_up_api.dart';
import 'package:qurb/models/response_model.dart';

import '../components/my_buttons.dart';
import '../models/user_model.dart';
import '../screens/home_screen.dart';
import '../screens/regesteration_screen.dart';

class SignUpScrenGetXController extends GetxController {
  RxBool isMale = false.obs;
  RxBool isLoading = false.obs;
  File? profileImage;
  TextEditingController email = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confrimPassword = TextEditingController();
  DateTime? birth;
  @override
  void onInit() {
    // email.text = "aa@adsad.aaa";
    // fullname.text = "test test";
    // mobile.text = "0982219358";
    // password.text = "1111";
    // confrimPassword.text = "1111";

    super.onInit();
  }

  void setProfileImage({required String path}) {
    profileImage = File(path);
    update();
  }

  void selectMale() {
    isMale.value = true;
    update();
  }

  void selectFemale() {
    isMale.value = false;
    update();
  }

  void signUp() async {
    if (email.text.isEmpty) {
      Constant.getDialgBox(
          context: Get.context!, body: 'الإيميل فارغ', title: 'تنبيه');
    } else if (!email.text.isEmail) {
      Constant.getDialgBox(
          context: Get.context!, body: 'الإيميل غير صحيح', title: 'تنبيه');
    } else if (fullname.text.isEmpty) {
      Constant.getDialgBox(
          context: Get.context!, body: 'الاسم فارغ', title: 'تنبيه');
    } else if (mobile.text.isEmpty) {
      Constant.getDialgBox(
          context: Get.context!, body: 'الموبايل فارغ', title: 'تنبيه');
    } else if (password.text.isEmpty) {
      Constant.getDialgBox(
          context: Get.context!, body: 'كلمة المرور فارغ', title: 'تنبيه');
    } else if (confrimPassword.text.isEmpty) {
      Constant.getDialgBox(
          context: Get.context!,
          body: 'تأكيد كلمة المرور فارغ',
          title: 'تنبيه');
    } else if (password.text != confrimPassword.text) {
      Constant.getDialgBox(
          context: Get.context!,
          body: 'كلمة المرور وتأكيد كلمة المرور غير متطابقتان',
          title: 'تنبيه');
    } else if (birth == null) {
      Constant.getDialgBox(
          context: Get.context!,
          body: 'يرجى اختيار تاريخ الميلاد',
          title: 'تنبيه');
    } else {
      isLoading(true);
      update();
      ResponseModel responseModel = await SignUpApi().callAPI(user: {
        'email': email.text,
        'password': Constant.getMd5String(input: password.text),
        'name': fullname.text,
        'gender': isMale.value ? '1' : '0',
        'mobile': mobile.text,
        'date_of_birth': Constant.formatDate(date: birth ?? DateTime.now()),
      }, file: profileImage);

      if (responseModel.code == 403 ||
          responseModel.code == 401 ||
          responseModel.code == 400) {
        Constant.getDialgBox(
          context: Get.context!,
          title: 'تنبيه',
          body: responseModel.message,
          actions: [
            MyButton(
              text: 'رجوع',
              action: () => Get.back(),
            )
          ],
        );
      } else if (responseModel.code == 0 || responseModel.code == 2) {
        Constant.getDialgBox(
          context: Get.context!,
          title: 'تنبيه',
          body: responseModel.message,
          actions: [
            MyButton(
              text: 'خروج',
              action: () {
                Constant.logOut();
                Get.offAll(() => const RegesterationScreen());
              },
            )
          ],
        );
      } else if (responseModel.code == 10 ||
          responseModel.code == 500 ||
          responseModel.code == 501) {
        Constant.getDialgBox(
          context: Get.context!,
          title: 'تنبيه',
          body: responseModel.message,
          actions: [
            MyButton(
              text: 'رجوع',
              action: () => Get.back(),
            ),
            MyButton(
              text: 'إعادة المحاولة',
              action: () {
                Get.back();
                signUp();
              },
            )
          ],
        );
      } else {
        UserModel userModel = UserModel.fromMap(responseModel.body['account']);
        final getStorage = GetIt.I.get<GetStorage>();
        getStorage.write('userModel', userModel.toMap());
        getStorage.write('loggedIn', true);
        Get.offAll(() => const HomeScreen());
      }
      isLoading(false);
      update();
    }

    // else if(){}
    // else{}
  }
}
