import 'package:flutter/material.dart';

import 'size_config.dart';

String baseUrl = 'http://192.168.43.171:8000/api/';

const kPrimaryColor = Color.fromARGB(255, 33, 214, 124);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color.fromARGB(255, 33, 216, 73), Color.fromARGB(255, 33, 216, 79)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "الرجاء إدخال بريدك الألكتروني";
const String kInvalidEmailError = "الرجاء قم بإدخال بريد صحيح ";
const String kPassNullError = "الرجاء قم بإدخال كلمة المرور ";
const String kShortPassError = "كلمة المرور قصيرة";
const String kMatchPassError = "كلمات المرور غير متطابقة";
const String kNamelNullError = " الرجاء بإدخال اسمك";
const String kPhoneNumberNullError = "الرجاء إدخال رقم الهاتف";
const String kAddressNullError = "الرجاء إدخال عنوانك";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
