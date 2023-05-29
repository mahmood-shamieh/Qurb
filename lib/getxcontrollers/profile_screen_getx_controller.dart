import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qurb/controllers/update_profile_api.dart';
import 'package:qurb/models/user_model.dart';
import 'package:qurb/screens/regesteration_screen.dart';

import '../components/my_buttons.dart';
import '../constant.dart';
import '../controllers/sign_up_api.dart';
import '../models/response_model.dart';
import '../screens/home_screen.dart';

class ProfileScreenGetXController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isMale = false.obs;
  RxBool changeHappend = false.obs;
  File? profileImage;
  String imagepath = '';
  DateTime? birth;
  bool haveImage = false;
  TextEditingController email = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confrimPassword = TextEditingController();
  @override
  void onInit() {
    final GetStorage storage = GetIt.I.get<GetStorage>();
    UserModel userModel = UserModel.fromMap(storage.read('userModel'));
    // print(userModel);
    if (userModel.email != null) {
      email.text = userModel.email!;
    }
    if (userModel.name != null) {
      fullname.text = userModel.name!;
    }
    if (userModel.mobile != null) {
      mobile.text = userModel.mobile!;
    }
    if (userModel.date_of_birth != null) {
      birth = userModel.date_of_birth;
    }
    if (userModel.gender != null && userModel.gender == 0.toString()) {
      isMale.value = false;
      update();
    }
    if (userModel.gender != null && userModel.gender == 1.toString()) {
      isMale.value = true;
      update();
    }
    if (userModel.image != null && userModel.image!.isNotEmpty) {
      haveImage = true;
      imagepath = userModel.image!;
    }
    super.onInit();
  }

  void setProfileImage({required String path}) {
    profileImage = File(path);
    haveImage = false;
    changeHappend.value = true;
    update();
  }

  void onChangeTextField() {
    // FocusScope.of(Get.context!).unfocus();
    final GetStorage storage = GetIt.I.get<GetStorage>();
    UserModel userModel = UserModel.fromMap(storage.read('userModel'));
    if (userModel.email != email.text) {
      changeHappend.value = true;
      update();
    } else if (userModel.name != fullname.text) {
      changeHappend.value = true;
      update();
    } else if (userModel.mobile != mobile.text) {
      changeHappend.value = true;
      update();
    }
  }

  void updateProfileData() async {
    final GetStorage storage = GetIt.I.get<GetStorage>();
    UserModel userModel = UserModel.fromMap(storage.read('userModel'));
    isLoading(true);
    update();
    Map<String, String> data = {
      'email': email.text,
      'name': fullname.text,
      'mobile': mobile.text,
      'date_of_birth': Constant.formatDate(date: birth ?? DateTime.now()),
      'user_id': userModel.id!,
      'token': userModel.token!
    };
    if (password.text.isNotEmpty &&
        confrimPassword.text.isNotEmpty &&
        password.text == confrimPassword.text) {
      data['password'] = Constant.getMd5String(input: password.text);
    }
    ResponseModel responseModel =
        await UpdateProfileApi().callAPI(user: data, file: profileImage);

    if (responseModel.code == 403 || responseModel.code == 401) {
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
    } else if (responseModel.code == 0 ||
        responseModel.code == 2 ||
        responseModel.code == 400) {
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
              updateProfileData();
            },
          )
        ],
      );
    } else {
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
