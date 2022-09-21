import 'dart:math';

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/search/product_for_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../size_config.dart';
import '../users_controller.dart';

final _formKey = GlobalKey<FormState>();

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);
  final _controller = Get.find<UsersController>();
  List<String> ass = [];
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 12; i++) {
      ass.add(getRandomString(5));
    }
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'المستخدمين',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: _controller.getUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingWidget();
                } else {
                  print(_controller.users.length);
                  return GetBuilder(
                    init: UsersController(),
                    builder: (_) {
                      return ListView.builder(
                        itemCount: _controller.users.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = _controller.users[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onLongPress: () {
                                Get.dialog(Center(
                                  child: Container(
                                    height: getProportionateScreenHeight(150),
                                    width: getProportionateScreenWidth(
                                        SizeConfig.screenWidth * .9),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                              Get.defaultDialog(
                                                title: 'حذف مستخدم',
                                                content: Center(
                                                  child: Text(
                                                    'هل أنت متأكد أنك تريد حذف هذا المستخدم',
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade800,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                confirm: ElevatedButton(
                                                  onPressed: () async {
                                                    Get.back();
                                                    EasyLoading.show(
                                                        dismissOnTap: true);
                                                    var res = await _controller
                                                        .deleteUser(
                                                            item.id.toString(),
                                                            index);
                                                    if (res == null) {
                                                      EasyLoading.showError(
                                                          'حدث خطأ ما ارجاء المحاولة مرة أخرى');
                                                    } else {
                                                      EasyLoading.showSuccess(
                                                        'تم حذف المستخدم ',
                                                      );
                                                    }
                                                  },
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(
                                                      Colors.redAccent,
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'تأكيد',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                cancel: ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(
                                                      Colors.white,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'إالغاء الأمر',
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade800,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.redAccent),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.delete_outline,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  'حذف المستخدم',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                              Get.defaultDialog(
                                                  textConfirm: 'تأكيد',
                                                  title:
                                                      'تغيير كلمة مرور المستخدم',
                                                  textCancel: 'إالغاء',
                                                  content: Form(
                                                    key: _formKey,
                                                    child: Column(
                                                      children: [
                                                        NewPasswordFeild(
                                                          onChange: (value) {
                                                            _controller
                                                                    .oldPassword =
                                                                value;
                                                          },
                                                          validator: (value) {
                                                            if (value.isEmpty) {
                                                              return kPassNullError;
                                                            }
                                                          },
                                                          label:
                                                              'كلمة المرور القديمة',
                                                          hint:
                                                              'أدخل كلمة المرور القديمة',
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              getProportionateScreenHeight(
                                                                  20),
                                                        ),
                                                        NewPasswordFeild(
                                                          onChange: (value) {
                                                            _controller
                                                                    .newPassword =
                                                                value;
                                                          },
                                                          validator: (value) {
                                                            if (value.isEmpty) {
                                                              return kPassNullError;
                                                            }
                                                          },
                                                          label:
                                                              'كلمة المرور الجديدة',
                                                          hint:
                                                              'أدخل كلمة المرور الجديدة',
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              getProportionateScreenHeight(
                                                                  20),
                                                        ),
                                                        NewPasswordFeild(
                                                          onChange: (value) {},
                                                          validator: (value) {
                                                            if (value !=
                                                                _controller
                                                                    .oldPassword) {
                                                              return 'كلمات المرور غير متطابقة';
                                                            }
                                                            if (value.isEmpty) {
                                                              return kPassNullError;
                                                            }
                                                          },
                                                          label:
                                                              'تأكيد كلمة المرور',
                                                          hint:
                                                              "أعد إدخال الكلمة الجديدة",
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              getProportionateScreenHeight(
                                                                  20),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  onConfirm: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      _formKey.currentState!
                                                          .save();
                                                      print('Its work');
                                                    }
                                                  });
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      kPrimaryColor),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                const Icon(
                                                  Icons.lock,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 5),
                                                const Text(
                                                  'تعديل كمة المرور',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                              },
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                tileColor: kPrimaryColor.withOpacity(0.2),
                                leading: Container(
                                  height: getProportionateScreenHeight(30),
                                  width: getProportionateScreenWidth(30),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.person,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  item.name_market.toString(),
                                ),
                                subtitle: Text(
                                  item.name_user.toString(),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class NewPasswordFeild extends StatelessWidget {
  NewPasswordFeild({
    Key? key,
    this.hint,
    this.label,
    this.onChange,
    this.validator,
  }) : super(key: key);
  final onChange;
  final validator;
  final label;
  final hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(
        labelText: label!,
        hintText: hint!,
        labelStyle: TextStyle(fontSize: 20),
        hintStyle: TextStyle(fontSize: 15),
        hintTextDirection: TextDirection.rtl,

        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(25),
            horizontal: getProportionateScreenWidth(15)),
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }
}
