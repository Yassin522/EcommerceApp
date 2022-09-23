import 'package:ecommerce/admin/screens/add%20product/add_product_controller.dart';
import 'package:ecommerce/admin/screens/add%20product/components/Image_pick.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var _controller = Get.find<AddProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PickingImageButton(),
            SizedBox(height: getProportionateScreenHeight(20)),
            GetBuilder(
                init: AddProductController(),
                builder: (_) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AddProductField(
                          label: 'اسم المنتج',
                          hint: 'أدخل اسم المنتج',
                          onChange: (value) {
                            _controller.product.name = value;
                            _controller.update();
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return kEmptyField;
                            }
                          },
                          value: _controller.product.name,
                        ),
                        AddProductField(
                          kType: TextInputType.multiline,
                          label: 'شرح عن المنتج',
                          hint: 'أدخل شرح بسيط عن المنتج',
                          onChange: (value) {
                            _controller.product.description = value;
                            _controller.update();
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return kEmptyField;
                            }
                          },
                          value: _controller.product.description,
                        ),
                        AddProductField(
                          label: 'الحجم',
                          hint: 'أدخل حجم للمنتج',
                          onChange: (value) {
                            _controller.product.size = value;
                            _controller.update();
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return kEmptyField;
                            }
                          },
                          value: _controller.product.size,
                        ),
                        AddProductField(
                          kType: TextInputType.number,
                          label: 'السعر',
                          hint: 'أدخل سعر المنتج',
                          onChange: (value) {
                            _controller.product.price = value;
                            _controller.update();
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return kEmptyField;
                            }
                          },
                          value: _controller.product.price,
                        ),
                        AddProductField(
                          label: 'النكهة ',
                          hint: 'أدخل نكهة المنتج(اختياري)',
                          onChange: (value) {
                            _controller.productColor.color = value;
                            _controller.update();
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return kEmptyField;
                            }
                          },
                          value: _controller.product.name,
                        ),
                        AddProductField(
                          kType: TextInputType.number,
                          label: 'الكمية',
                          hint: 'أدخل الكمية المتوافرة من المنتج',
                          onChange: (value) {
                            _controller.productColor.quantity = value;
                            _controller.update();
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return kEmptyField;
                            }
                          },
                          value: _controller.product.name,
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
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print('ok');
                  }
                },
                child: Text('ok'),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
          ],
        ),
      ),
    );
  }
}

class AddProductField extends StatelessWidget {
  AddProductField({
    Key? key,
    this.hint,
    this.label,
    this.onChange,
    this.validator,
    this.value,
    this.kType,
  }) : super(key: key);
  final onChange;
  final validator;
  final label;
  final hint;
  final value;
  final kType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
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
