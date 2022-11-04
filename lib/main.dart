import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ecommerce/routes/app_routes.dart';

import 'package:ecommerce/theme.dart';

import 'routes.dart';
import 'screens/home/home_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var role_id = GetStorage().read('role_id');
    var initPage = AppPages.INITIAL;
    /*if (role_id == '1') {
      initPage = AppPages.adminhome;
    } else if (role_id == '2') {
      initPage = AppPages.home;
    }*/
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name

      initialRoute: initPage,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),

    );
  }
}
