import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXThemeController extends GetxController {
  RxBool isDarkMode = false.obs;
  void changeThemeMode() {
    if (isDarkMode.value) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
    isDarkMode.value = !isDarkMode.value;
    update();
  }
}
