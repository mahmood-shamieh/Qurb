import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qurb/components/my_buttons.dart';
import 'package:qurb/constant.dart';
import 'package:qurb/controllers/sign_in_api.dart';
import 'package:qurb/models/response_model.dart';
import 'package:qurb/models/user_model.dart';
import 'package:qurb/screens/home_screen.dart';

import '../screens/regesteration_screen.dart';

class SignInPageGetXController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void onInit() {
    // email.text = 'mahmoodshamieh@gmail.com';
    // password.text = '1111';

    super.onInit();
  }

  void signIn() async {
    if (email.text.isEmpty || !email.text.isEmail) {
      Constant.getDialgBox(
        context: Get.context!,
        title: 'تنبيه',
        body: email.text.isEmpty
            ? "البريد الإلكتروني فارغ"
            : "البريد الإلكتروني غير صحيح",
        actions: [
          MyButton(
            text: 'رجوع',
            action: () => Get.back(),
          )
        ],
      );
    } else if (password.text.isEmpty) {
      Constant.getDialgBox(
        context: Get.context!,
        title: 'تنبيه',
        body: "كلمة المرور فارغة",
        actions: [
          MyButton(
            text: 'رجوع',
            action: () => Get.back(),
          )
        ],
      );
    } else {
      isLoading(true);
      update();
      ResponseModel responseModel = await SignInApi().callAPI(user: {
        'email': email.text,
        'password': Constant.getMd5String(input: password.text),
      });
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
                signIn();
              },
            )
          ],
        );
      } else {
        print(responseModel);
        UserModel userModel = UserModel.fromMap(responseModel.body);
        final getStorage = GetIt.I.get<GetStorage>();
        getStorage.write('userModel', userModel.toMap());
        getStorage.write('loggedIn', true);
        Get.offAll(() => const HomeScreen());
      }
      isLoading(false);
      update();
    }
  }
}
