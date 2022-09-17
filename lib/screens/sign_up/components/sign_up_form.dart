import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ecommerce/components/custom_surfix_icon.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce/screens/sign_in/controller/signIn_controller.dart';
import 'package:ecommerce/screens/sign_up/controller/signUp_contoller.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../otp/otp_screen.dart';
import '../../sign_in/Models/global_user_info.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String?> errors = [];
  SignUpController _controller = Get.find<SignUpController>();
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMarketFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildaddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildphoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildcityFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: 'تسجيل',
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                EasyLoading.show(dismissOnTap: true);
                var opration = await _controller.signUp();
                if (opration == null) {
                  EasyLoading.showError('حدث خطأ ما , رجاء تأكد من المدخلات');
                } else {
                  EasyLoading.showSuccess(
                      'مرحباً , ${GlobalUserInfo.user!.user_name}');
                  Get.toNamed(AppPages.succse);
                }
                //
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {},
      validator: (value) {
        if (value != _controller.user!.password) {
          print(value);
          print(_controller.user!.password);
          return 'كلمات السر غير متطابقة';
        }
      },
      decoration: const InputDecoration(
        labelText: "تأكيد كلمة المرور",
        hintText: "أعد إدخال كلمة المرور",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) {},
      onChanged: (value) => _controller.user!.password = value,
      validator: (value) {
        print('Hellooo');
        if (value!.length < 8) {
          return 'كلمة السر يجب أن تكون 8 أحرف على الأقل';
        } else if (value.isEmpty) {
          return 'كلمة السر لا يمكن أن تكون فارغة';
        }
      },
      decoration: InputDecoration(
        labelText: "كلمة المرور",
        hintText: "أدخل كلمة المرور",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField buildMarketFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => _controller.user!.name_market = newValue,
      onChanged: (value) {
        _controller.user!.name_market = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'الحقل لا يمكن أن تكون فارغ';
        }
      },
      decoration: InputDecoration(
        labelText: "اسم متجرك",
        hintText: "أدخل اسم متجرك",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.email),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => _controller.user!.email = newValue,
      onChanged: (value) {
        _controller.user!.email = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'البريد الألكتروني لا يمكن أن تكون فارغ';
        }
      },
      decoration: InputDecoration(
        labelText: "البريد الإلكتروني",
        hintText: "أدخل بريدك الألكتروني",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.email),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) => _controller.user!.address = newValue,
      onChanged: (value) {
        _controller.user!.name_user = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'الحقل لا يمكن أن تكون فارغة';
        }
      },
      decoration: const InputDecoration(
        labelText: "اسمك",
        hintText: "أدخل الأسم",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.place),
      ),
    );
  }

  TextFormField buildaddressFormField() {
    return TextFormField(
      onSaved: (newValue) => _controller.user!.address = newValue,
      onChanged: (value) {
        _controller.user!.address = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'الحقل لا يمكن أن تكون فارغة';
        }
      },
      decoration: const InputDecoration(
        labelText: "عنوانك",
        hintText: "أدخل العنوان",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.place),
      ),
    );
  }

  TextFormField buildphoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => _controller.user!.number_phone = newValue,
      onChanged: (value) {
        _controller.user!.number_phone = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'الحقل لا يمكن أن تكون فارغة';
        }
      },
      decoration: const InputDecoration(
        labelText: "رقم الهاتف",
        hintText: "أدخل رقم الهاتف",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.phone),
      ),
    );
  }

  TextFormField buildcityFormField() {
    return TextFormField(
      onSaved: (newValue) => _controller.user!.city = newValue,
      onChanged: (value) {
        _controller.user!.city = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'الحقل لا يمكن أن تكون فارغة';
        }
      },
      decoration: const InputDecoration(
        labelText: "المدينة",
        hintText: "المدينة التي تقيم بها",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.place),
      ),
    );
  }
}
