import 'package:ecommerce/screens/details/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/components/rounded_icon_btn.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: GetBuilder(
            init: DetailController(),
            builder: (DetailController c) {
              return Row(
                children: [
                  /* ...List.generate(
            product.colors.length,
            (index) => ColorDot(
              color: product.colors[index],
              isSelected: index == selectedColor,
            ),
          ),*/
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Text(
                    "${c.initprice.value}  ل.س",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  Spacer(),
                  RoundedIconBtn(
                    icon: Icons.remove,
                    press: () {
                      c.minusCounter(product.price!);
                    },
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                  Text(
                    "${c.numbersofProducts.value}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                  RoundedIconBtn(
                    icon: Icons.add,
                    showShadow: true,
                    press: () {
                      c.addCounter(product.price!);
                    },
                  ),
                ],
              );
            }));
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
