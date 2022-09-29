import 'dart:io';

import 'package:ecommerce/admin/screens/edit%20product/edit_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../add product/components/Image_pick.dart';

class ColorImage extends StatelessWidget {
  ColorImage({
    Key? key,
  }) : super(key: key);
  var _controller = Get.find<EditProductController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getProportionateScreenHeight(200),
        width: SizeConfig.screenWidth,
        child: Center(
          child: GestureDetector(
              onTap: () async {
                var file = await pickImage();
                if (file == null) {
                  return;
                } else {
                  _controller.updateColorImage(file);
                }
              },
              child: GetBuilder(
                init: EditProductController(),
                builder: (_) {
                  return _controller.colrImage == null
                      ? Container(
                          height: getProportionateScreenHeight(200) * .7,
                          width: SizeConfig.screenWidth * .8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kPrimaryColor.withOpacity(0.15),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_photo_alternate_outlined),
                                SizedBox(
                                  height: getProportionateScreenHeight(5),
                                ),
                                Text('أضف صورة للمنتج'),
                              ]),
                        )
                      : Container(
                          height: getProportionateScreenHeight(200) * .7,
                          width: SizeConfig.screenWidth * .8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kPrimaryColor.withOpacity(0.15),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: _controller.isEdit
                                    ? NetworkImage(
                                            '${imagebaseUrl}${_controller.colrImage}')
                                        as ImageProvider
                                    : FileImage(
                                        File(_controller.colrImage.path))),
                          ),
                        );
                },
              )),
        ));
  }
}
