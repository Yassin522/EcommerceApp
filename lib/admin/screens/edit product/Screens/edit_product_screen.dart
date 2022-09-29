import 'package:ecommerce/admin/screens/add%20product/add_product_controller.dart';
import 'package:ecommerce/admin/screens/add%20product/components/Image_pick.dart';
import 'package:ecommerce/admin/screens/edit%20product/components/edited_image.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/category.dart';
import 'package:ecommerce/screens/search/product_for_category.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../edit_product_controller.dart';

class EditProductScreen extends StatelessWidget {
  EditProductScreen({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  var _controller = Get.find<EditProductController>();
  @override
  Widget build(BuildContext context) {
    print('-----------------------------------------------');
    _controller.takeNewProduct();
    print(_controller.newPro.name);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: FutureBuilder(
          future: _controller.getCate(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingWidget();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    EditedProductImage(),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    GetBuilder(
                        init: AddProductController(),
                        builder: (_) {
                          return Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                EditProductField(
                                  controller: _controller.name,
                                  label: 'اسم المنتج',
                                  hint: 'أدخل اسم المنتج',
                                  onChange: (value) {
                                    _controller.update();
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return kEmptyField;
                                    }
                                  },
                                ),
                                EditProductField(
                                  controller: _controller.description,
                                  kType: TextInputType.multiline,
                                  label: 'شرح عن المنتج',
                                  hint: 'أدخل شرح بسيط عن المنتج',
                                  onChange: (value) {
                                    _controller.update();
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return kEmptyField;
                                    }
                                  },
                                ),
                                EditProductField(
                                  controller: _controller.size,
                                  label: 'الحجم',
                                  hint: 'أدخل حجم للمنتج',
                                  onChange: (value) {
                                    _controller.update();
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return kEmptyField;
                                    }
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              getProportionateScreenWidth(10),
                                          vertical:
                                              getProportionateScreenHeight(5),
                                        ),
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: GetBuilder(
                                          init: EditProductController(),
                                          builder: (_) {
                                            return DropdownButton<Category>(
                                              value: _controller.chosenCategory,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              onChanged: (value) {
                                                _controller.updateCate(value!);
                                              },
                                              items: List.generate(
                                                  _controller.categories.length,
                                                  (index) {
                                                Category item = _controller
                                                    .categories[index];
                                                return DropdownMenuItem(
                                                  value: item,
                                                  child: Text(item.name),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                      Text(
                                        'أختر فئة للمنتج',
                                        style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                EditProductField(
                                  controller: _controller.price,
                                  kType: TextInputType.number,
                                  label: 'السعر',
                                  hint: 'أدخل سعر المنتج',
                                  onChange: (value) {
                                    _controller.update();
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return kEmptyField;
                                    }
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              getProportionateScreenWidth(10),
                                          vertical:
                                              getProportionateScreenHeight(5),
                                        ),
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: GetBuilder(
                                          init: EditProductController(),
                                          builder: (_) {
                                            return DropdownButton<String>(
                                                value: _controller.status,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                onChanged: (value) {
                                                  _controller
                                                      .updateStatus(value!);
                                                },
                                                items: [
                                                  DropdownMenuItem(
                                                    value: 'متوافر',
                                                    child: Text(
                                                      'متوافر',
                                                    ),
                                                    onTap: () {
                                                      _controller.updateStatus(
                                                          'متوافر');
                                                    },
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 'غير متوافر',
                                                    child: Text(
                                                      'غير متوافر',
                                                    ),
                                                    onTap: () {
                                                      _controller.updateStatus(
                                                          'غير متوافر');
                                                    },
                                                  ),
                                                ]);
                                          },
                                        ),
                                      ),
                                      Text(
                                        'هل لا يزال المنتج متوافر؟',
                                        style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(50),
                      width: SizeConfig.screenWidth * .8,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kPrimaryColor)),
                        onPressed: () async {
                          bool state = false;
                          if (_controller.chosenCategory != null &&
                              (_controller.chosenImage != null ||
                                  _controller.image != null)) {
                            state = true;
                          }
                          if (_formKey.currentState!.validate() && state) {
                            _formKey.currentState!.save();
                            print('ok');
                            EasyLoading.show(dismissOnTap: true);
                            var res = await _controller.updateProduct();
                            if (res == true) {
                              EasyLoading.showInfo('تم تحديث المنتج بنجاح!');
                            } else {
                              EasyLoading.showError(res);
                            }
                          } else {
                            print('Is work');
                          }
                        },
                        child: Text('تحديث المنتج'),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class EditProductField extends StatelessWidget {
  EditProductField({
    Key? key,
    this.hint,
    this.label,
    this.onChange,
    this.validator,
    this.value,
    this.kType,
    this.controller,
  }) : super(key: key);
  final onChange;
  final validator;
  final label;
  final hint;
  final value;
  final kType;
  final controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        keyboardType: kType != null ? kType : TextInputType.text,
        textDirection: RegExp(r'^[A-Za-z0-9]+$').hasMatch(value ?? '')
            ? TextDirection.ltr
            : TextDirection.rtl,
        onChanged: onChange ?? (_) {},
        validator: validator ?? (_) {},
        decoration: InputDecoration(
          labelText: label! ?? '',
          hintText: hint! ?? '',
          labelStyle: TextStyle(fontSize: 20),
          hintStyle: TextStyle(fontSize: 15),
          hintTextDirection: TextDirection.rtl,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(25),
              horizontal: getProportionateScreenWidth(15)),
        ),
      ),
    );
  }
}
