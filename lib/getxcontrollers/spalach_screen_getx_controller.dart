import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qurb/controllers/sign_in_api.dart';
import 'package:qurb/models/response_model.dart';
import 'package:qurb/models/user_model.dart';
import 'package:qurb/screens/regesteration_screen.dart';

import '../components/my_buttons.dart';
import '../constant.dart';
import '../screens/home_screen.dart';

class SplachScreenGetXController extends GetxController {
  RxBool isloading = false.obs;
  ResponseModel? responseModel =
      ResponseModel(body: [], message: '', code: 200, status: true);
  @override
  void onInit() async {
    isloading(true);
    update();
    final getStorage = GetIt.I.get<GetStorage>();
    if (getStorage.read('loggedIn') ?? false) {
      UserModel userModel = UserModel.fromMap(getStorage.read('userModel'));
      responseModel = await SignInApi().callAPI(
          user: {'email': userModel.email, 'password': userModel.password});
      if (responseModel!.code == 400) {
        Constant.getDialgBox(
          context: Get.context!,
          title: 'تنبيه',
          body: responseModel!.message,
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
      } else if (responseModel!.code == 403 || responseModel!.code == 401) {
        Constant.getDialgBox(
          context: Get.context!,
          title: 'تنبيه',
          body: responseModel!.message,
          actions: [
            MyButton(
              text: 'رجوع',
              action: () => Get.back(),
            )
          ],
        );
      } else if (responseModel!.code == 0 || responseModel!.code == 2) {
        Constant.getDialgBox(
          context: Get.context!,
          title: 'تنبيه',
          body: responseModel!.message,
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
      } else if (responseModel!.code == 10 ||
          responseModel!.code == 500 ||
          responseModel!.code == 501) {
        Constant.getDialgBox(
          context: Get.context!,
          title: 'تنبيه',
          body: responseModel!.message,
          actions: [
            MyButton(
              text: 'رجوع',
              action: () => Get.back(),
            ),
            MyButton(
              text: 'إعادة المحاولة',
              action: () {
                Get.back();
                onInit();
              },
            )
          ],
        );
      } else {
        print(responseModel);
        UserModel userModel = UserModel.fromMap(responseModel!.body);
        final getStorage = GetIt.I.get<GetStorage>();
        getStorage.write('userModel', userModel.toMap());
        getStorage.write('loggedIn', true);
        Get.off(() => const HomeScreen());
      }
    } else {
      Future.delayed(Duration(seconds: 2), () {
        Get.off(() => const RegesterationScreen());
      });
    }
    isloading(false);
    update();

    super.onInit();
  }
}
