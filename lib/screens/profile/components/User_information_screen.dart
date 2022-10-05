import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/profile/profile_controller.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);
  var _controller = Get.find<ProfileController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('تعديل المعلومات الشخصية'),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder(
                init: ProfileController(),
                builder: (_) {
                  return Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: _formKey,
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(200),
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'الملف الشخصي',
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                        ),
                        ProfileInfoField(
                          txtcontroller: _controller.user_nameCo,
                          label: 'اسم مالك المتجر',
                        ),
                        ProfileInfoField(
                          txtcontroller: _controller.market_nameCo,
                          label: 'اسم المتجر',
                        ),
                        ProfileInfoField(
                          txtcontroller: _controller.phone_numberCo,
                          label: 'رقم الهاتف',
                        ),
                        ProfileInfoField(
                          txtcontroller: _controller.addressCo,
                          label: "عنوان المتجر",
                        ),
                        ProfileInfoField(
                          txtcontroller: _controller.cityCo,
                          label: 'المدينة',
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(50),
                          width: getProportionateScreenWidth(150),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kPrimaryColor)),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                EasyLoading.show(dismissOnTap: true);
                                var resulte = await _controller.updateProfile();

                                if (resulte == true) {
                                  EasyLoading.showSuccess('تم تحديث المعلومات');
                                } else {
                                  EasyLoading.showError(
                                      'حدث خطأ ما الرجاء الحاولة مرة أخرى');
                                }
                              }
                            },
                            child: Center(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.check_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'حفظ التغييرات',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        )
                      ],
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}

class ProfileInfoField extends StatelessWidget {
  ProfileInfoField({
    Key? key,
    this.txtcontroller,
    this.label,
  }) : super(key: key);
  TextEditingController? txtcontroller;
  String? label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20, bottom: 5),
              child: Text(
                label.toString(),
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(75),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              onSaved: (_) {
                var c = Get.find<ProfileController>();
                c.update();
              },
              onChanged: (_) {
                var c = Get.find<ProfileController>();
                c.update();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'الحقل لا يمكن أن يكون فارغ';
                }
              },
              textDirection:
                  RegExp(r'^[A-Za-z0-9]+$').hasMatch(txtcontroller!.text)
                      ? TextDirection.ltr
                      : TextDirection.rtl,
              controller: txtcontroller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                hintText: label,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
