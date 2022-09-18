import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/screens/home/hpme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
              text: "حسابي",
              icon: "assets/icons/User Icon.svg",
              press: () => Get.toNamed(AppPages.profileInfo)),
          /*ProfileMenu(
            text: "اشعارات",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),*/
          ProfileMenu(
            text: "الاعدادات",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          /*ProfileMenu(
            text: "مركز الدعم",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),*/
          ProfileMenu(
            text: "تسجيل الخروج",
            icon: "assets/icons/Log out.svg",
            press: () async {
              var _controller = Get.find<HomeController>();
              EasyLoading.show(dismissOnTap: true);
              var result = await _controller.logout();

              if (result == true) {
                EasyLoading.showSuccess('تم تسجيل الخروج');
                Get.toNamed(AppPages.signin);
              } else {
                EasyLoading.showError('حدث خطأ ما الرجاء إعادة المحاولة');
              }
            },
          ),
        ],
      ),
    );
  }
}
