import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qurb/screens/splach_screen.dart';
import 'package:qurb/themes/my_theme.dart';
// import 'package:get';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final getIt = GetIt.instance;
  await GetStorage.init();
  GetStorage storage = GetStorage();
  // storage.erase();
  getIt.registerSingleton(storage);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: SplachScreen(),
      // home: const Directionality(
      //     textDirection: TextDirection.rtl, child: SplachScreen()),
    );
  }
}
