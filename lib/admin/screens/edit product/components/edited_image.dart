import 'dart:io';

import 'package:ecommerce/admin/screens/edit%20product/edit_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../add product/components/Image_pick.dart';

class EditedProductImage extends StatelessWidget {
  EditedProductImage({
    Key? key,
  }) : super(key: key);
  var _controller = Get.find<EditProductController>();
  var image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getProportionateScreenHeight(300),
        width: SizeConfig.screenWidth,
        child: Center(
          child: GestureDetector(
              onTap: () async {
                var file = await pickImage();
                if (file == null) {
                  return;
                } else {
                  _controller.updateImage(file);
                }
              },
              child: GetBuilder(
                init: EditProductController(),
                builder: (_) {
                  return _controller.chosenImage != null
                      ? Container(
                          height: getProportionateScreenHeight(300) * .7,
                          width: SizeConfig.screenWidth * .8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kPrimaryColor.withOpacity(0.15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(_controller.chosenImage!.path),
                                ),
                              )),
                        )
                      : Container(
                          height: getProportionateScreenHeight(300) * .7,
                          width: SizeConfig.screenWidth * .8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kPrimaryColor.withOpacity(0.15),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  '$imagebaseUrl${_controller.image}'),
                            ),
                          ),
                        );
                },
              )),
        ));
  }
}
