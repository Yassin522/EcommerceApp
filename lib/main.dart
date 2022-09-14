import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ecommerce/routes/app_routes.dart';

import 'package:ecommerce/theme.dart';

import 'routes.dart';
import 'screens/home/home_screen.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //منوررررررررررررررررررررررررررررررررررررررررررررر
  // no u
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name

      initialRoute: AppPages.home,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    );
  }
}
