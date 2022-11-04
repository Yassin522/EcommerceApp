import 'dart:io';

import 'package:ecommerce/admin/screens/add%20product/components/Image_pick.dart';
import 'package:ecommerce/admin/screens/app_setting/settings_controller.dart';
import 'package:ecommerce/admin/screens/search/product_for_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  var _controller = Get.find<SettingController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'معلومات المتجر',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: kPrimaryColor,
          leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Get.back();
              }),
        ),
        body: FutureBuilder(
          future: _controller.getSettings(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget();
            } else {
              return SingleChildScrollView(
                  child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    GetBuilder(
                        init: SettingController(),
                        builder: (_) {
                          return GestureDetector(
                            onTap: () async {
                              var file = await pickImage();
                              _controller.updateImage(file);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _controller.chosenImage != null
                                  ? Container(
                                      width: getProportionateScreenWidth(300),
                                      height: getProportionateScreenHeight(200),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kPrimaryColor.withOpacity(0.30),
                                        image: DecorationImage(
                                          image: FileImage(
                                            File(
                                              _controller.chosenImage!.path,
                                            ),
                                          ),
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: getProportionateScreenWidth(300),
                                      height: getProportionateScreenHeight(200),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kPrimaryColor.withOpacity(0.30),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              '$imagebaseUrl/${_controller.image}'),
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                            ),
                          );
                        }),
                    SettingInfoCard(
                      label: 'الأسم',
                      txtcontroller: _controller.name,
                    ),
                    SettingInfoCard(
                      label: 'الوصف',
                      txtcontroller: _controller.description,
                      inputType: TextInputType.multiline,
                    ),
                    SettingInfoCard(
                      label: 'الهاتف',
                      txtcontroller: _controller.phone,
                      inputType: TextInputType.name,
                    ),
                    SettingInfoCard(
                      label: 'واتساب',
                      txtcontroller: _controller.whatsapp,
                      inputType: TextInputType.url,
                    ),
                    SettingInfoCard(
                      label: 'العنوان',
                      txtcontroller: _controller.address,
                      inputType: TextInputType.streetAddress,
                    ),
                    SettingInfoCard(
                      label: 'أعلى سعر لفاتورة',
                      txtcontroller: _controller.total_cost,
                      inputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
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
                            var res = await _controller.updateSettings();
                            print(res);
                            if (res != null) {
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
                      height: 20,
                    )
                  ],
                ),
              ));
            }
          },
        ),
      ),
    );
  }
}

class SettingInfoCard extends StatelessWidget {
  SettingInfoCard({
    Key? key,
    this.txtcontroller,
    this.label,
    this.inputType,
  }) : super(key: key);
  TextEditingController? txtcontroller;
  String? label;
  TextInputType? inputType;
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
              keyboardType: inputType ?? TextInputType.name,
              autovalidateMode: AutovalidateMode.always,
              onSaved: (_) {
                //var c = Get.find<ProfileController>();
                // c.update();
              },
              onChanged: (_) {
                // var c = Get.find<ProfileController>();
                // c.update();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'الحقل لا يمكن أن يكون فارغ';
                }
              },
              textDirection:
                  RegExp(r'^[A-Za-z0-9]+$').hasMatch(txtcontroller?.text ?? ' ')
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
