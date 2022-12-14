import 'package:ecommerce/admin/screens/add%20product/Models/product_color_model.dart';
import 'package:ecommerce/admin/screens/add%20product/add_product_screen.dart';
import 'package:ecommerce/admin/screens/edit%20product/Screens/edit_product_screen.dart';
import 'package:ecommerce/admin/screens/edit%20product/components/edited_image.dart';
import 'package:ecommerce/admin/screens/edit%20product/edit_product_controller.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/screens/details/details_controller.dart';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:get/get.dart';

import '../../../admin/screens/add product/components/Image_pick.dart';
import '../../../admin/screens/edit product/components/color_image.dart';
import '../../../admin/screens/home/home_controller.dart';
import '../../../admin/screens/search/product_for_category.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;
  //final c = Get.find<DetailController>();

  var _editController = Get.find<EditProductController>();
  @override
  Widget build(BuildContext context) {
    _editController.newPro = product;
    _editController.image = product.image;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Visibility(
            visible: GlobalUserInfo.user!.role_id == '1' ? true : false,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(30)),
                child: ProductActionButtons(product: product)),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(12),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            product.name!,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(12),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text('${product.price.toString()} ??.??',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor)),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color: Color(0xFFFFE6E6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color: Color(0xFFFF4848),
              height: getProportionateScreenWidth(16),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            product.description!,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ProductActionButtons extends StatelessWidget {
  ProductActionButtons({
    Key? key,
    this.product,
  }) : super(key: key);
  var _editController = Get.find<EditProductController>();
  Product? product;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context) {
        return [
          PopupMenuItem(
            value: '?????????? ????????????',
            child: InkWell(
              onTap: () {
                Get.back();
                Get.toNamed(
                  AppPages.admineditproudct,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.shopping_bag,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(4),
                  ),
                  const Text(
                    '?????????? ????????????',
                  ),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: '?????? ????????????',
            child: GestureDetector(
              onTap: () async {
                Get.back();
                EasyLoading.show(dismissOnTap: true);
                var res =
                    await _editController.deleteProduct(product!.id.toString());
                if (res == true) {
                  Get.back();
                  var c = Get.find<AdminHomeController>();
                  c.update();
                  EasyLoading.showSuccess('???? ?????? ????????????');
                } else {
                  EasyLoading.showError(
                      '?????? ?????? ???????????? ???????????? ???????????????? ?????? ????????');
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.delete_forever,
                    color: Colors.redAccent,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(4),
                  ),
                  Text(
                    '?????? ????????????',
                  ),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: '?????????? ????????',
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.defaultDialog(
                  title: '?????????? ???????? ??????????',
                  content: SizedBox(
                    height: Get.size.height * .7,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('???????? ?????? ???????????? ???????????? ????????????'),
                          ColorImage(),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          GetBuilder(
                              init: EditProductController(),
                              builder: (_) {
                                return Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      EditProductField(
                                        controller: _editController.color,
                                        label: '???????????? ',
                                        hint: '???????? ???????? ????????????',
                                        onChange: (value) {
                                          _editController.update();
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return kEmptyField;
                                          }
                                        },
                                        value: _editController.color?.text,
                                      ),
                                      EditProductField(
                                        controller: _editController.quantity,
                                        kType: TextInputType.number,
                                        label: '????????????',
                                        hint: '???????? ???????????? ?????????????????? ???? ????????????',
                                        onChange: (value) {
                                          _editController.update();
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return kEmptyField;
                                          }
                                        },
                                        value: _editController.quantity?.text,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          SizedBox(height: 20 / Get.size.height),
                          SizedBox(
                            height: Get.size.height * .07,
                            width: Get.size.width * .8,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kPrimaryColor)),
                              onPressed: () async {
                                bool state = false;
                                if (_editController.colrImage != null) {
                                  state = true;
                                }
                                if (_formKey.currentState!.validate() &&
                                    state) {
                                  _formKey.currentState!.save();
                                  print('ok');
                                  EasyLoading.show(dismissOnTap: true);
                                  var res = await _editController
                                      .addNewcolor(product!.id.toString());
                                  if (res == true) {
                                    EasyLoading.showInfo(
                                        '???? ?????????? ???????? ?????????? ??????????!');
                                    var detail = Get.find<DetailController>();
                                    detail.update();
                                  } else {
                                    EasyLoading.showError(
                                        '?????? ?????? ???? ???????????? ???????????????? ?????? ????????');
                                  }
                                } else {
                                  print('Is work');
                                }
                              },
                              child: Text('?????????? ????????????'),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.fiber_new_outlined,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(4),
                  ),
                  Text(
                    '?????????? ???????? ???????? ????????????',
                  ),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: '?????????? ????????',
            child: GestureDetector(
              onTap: () {
                Get.back();
                var newColor = ProductColorModel();
                var det = Get.find<DetailController>();
                newColor.color =
                    det.productImages.value[det.selectedImage.value].name;
                newColor.quantity = det
                    .productImages.value[det.selectedImage.value].quantity
                    .toString();
                _editController.colrImage =
                    det.productImages.value[det.selectedImage.value].image;
                newColor.product_id = product!.id.toString();
                _editController.isEdit = true;
                _editController.takeColor(newColor);
                Get.defaultDialog(
                  title: '?????????? ????????????',
                  content: SizedBox(
                    height: Get.size.height * .7,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('???????? ?????? ???????????? ???????????? ????????????'),
                          ColorImage(),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          GetBuilder(
                              init: EditProductController(),
                              builder: (_) {
                                return Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      EditProductField(
                                        controller: _editController.color,
                                        label: '???????????? ',
                                        hint: '???????? ???????? ????????????',
                                        onChange: (value) {
                                          _editController.update();
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return kEmptyField;
                                          }
                                        },
                                        value: _editController.color?.text,
                                      ),
                                      EditProductField(
                                        controller: _editController.quantity,
                                        kType: TextInputType.number,
                                        label: '????????????',
                                        hint: '???????? ???????????? ?????????????????? ???? ????????????',
                                        onChange: (value) {
                                          _editController.update();
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return kEmptyField;
                                          }
                                        },
                                        value: _editController.quantity?.text,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          SizedBox(height: 20 / Get.size.height),
                          SizedBox(
                            height: Get.size.height * .07,
                            width: Get.size.width * .8,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kPrimaryColor)),
                              onPressed: () async {
                                bool state = false;
                                if (_editController.colrImage != null) {
                                  state = true;
                                }
                                if (_formKey.currentState!.validate() &&
                                    state) {
                                  _formKey.currentState!.save();
                                  print('ok');
                                  EasyLoading.show(dismissOnTap: true);
                                  var res = await _editController
                                      .updateColor(product!.id.toString());
                                  if (res == true) {
                                    EasyLoading.showInfo(
                                        '???? ?????????? ???????????? ??????????????');
                                    var detail = Get.find<DetailController>();
                                    detail.update();
                                  } else {
                                    EasyLoading.showError(
                                        '?????? ?????? ???? ???????????? ???????????????? ?????? ????????');
                                  }
                                } else {
                                  print('Is work');
                                }
                              },
                              child: Text('?????????? ????????????'),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.fiber_new_outlined,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(4),
                  ),
                  Text(
                    '?????????? ???????????? ??????????????',
                  ),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: '?????? ????????',
            child: GestureDetector(
              onTap: () async {
                Get.back();
                var det = Get.find<DetailController>();
                var id = det
                    .productImages.value[det.selectedImage.value].productColorId
                    .toString();
                print('idddddddddddddddddddddddddddd' + id);
                EasyLoading.show(dismissOnTap: true);
                print("fffff");
                var res = await _editController.deleteColor(id);
                print("bbbbbbb");
                det.update();
                print("lllll");
                if (res == true) {
                  print("mmmmmmmmm");
                  Get.offNamed(AppPages.adminhome);
                  EasyLoading.showSuccess('???? ?????? ???????????? ??????????');

                  print("sssssssss");
                } else {
                  print("nnnnnnnnnnn");
                  EasyLoading.showError('?????? ?????? ???? ???????????? ???????????????? ?????? ????????');
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(4),
                  ),
                  Text(
                    '?????? ????????????',
                  ),
                ],
              ),
            ),
          ),
        ];
      }),
      icon: Icon(
        Icons.menu,
        color: kPrimaryColor,
      ),
      iconSize: 30,
    );
  }
}

class DetaiActionButton extends StatelessWidget {
  DetaiActionButton({
    Key? key,
    this.icon,
    this.onPress,
  }) : super(key: key);
  final onPress;
  final icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(icon),
    );
  }
}
