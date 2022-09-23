import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class PickingImageButton extends StatelessWidget {
  const PickingImageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getProportionateScreenHeight(300),
        width: SizeConfig.screenWidth,
        child: Center(
          child: Container(
            height: getProportionateScreenHeight(300) * .7,
            width: SizeConfig.screenWidth * .8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kPrimaryColor.withOpacity(0.15),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.add_photo_alternate_outlined),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Text('أضف صورة للمنتج'),
            ]),
          ),
        ));
  }
}
