import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/screens/sign_up/sign_up_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(AppPages.signup),
          child: Text(
            "أنشئ حساب",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(15),
        ),
        Text(
          'ليس لديك حساب ؟',
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
      ],
    );
  }
}
