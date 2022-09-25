import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: GlobalUserInfo.user!.role_id == '1' ? false : true,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DetaiActionButton(
                    onPress: () {},
                    icon: Icons.add,
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  DetaiActionButton(
                    onPress: () {},
                    icon: Icons.edit,
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  DetaiActionButton(
                    onPress: () {},
                    icon: Icons.delete,
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                ],
              ),
            )),
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
