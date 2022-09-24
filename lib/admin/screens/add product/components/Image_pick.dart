import 'dart:io';

import 'package:ecommerce/admin/screens/add%20product/add_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class PickingImageButton extends StatelessWidget {
  PickingImageButton({
    Key? key,
  }) : super(key: key);
  var _controller = Get.find<AddProductController>();

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
                init: AddProductController(),
                builder: (_) {
                  return _controller.chosenImage == null
                      ? Container(
                          height: getProportionateScreenHeight(300) * .7,
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
                          height: getProportionateScreenHeight(300) * .7,
                          width: SizeConfig.screenWidth * .8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kPrimaryColor.withOpacity(0.15),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                    File(_controller.chosenImage!.path))),
                          ),
                        );
                },
              )),
        ));
  }
}

pickImage() async {
  ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: ImageSource.gallery);
  if (_file != null) {
    return _file;
  } else {
    return;
  }
}
