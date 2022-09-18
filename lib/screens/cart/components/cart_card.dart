import 'package:ecommerce/screens/cart/cartController.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/models/Cart.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../cart_screen.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
    required this.imageUrl,
  }) : super(key: key);

  final Cart cart;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CartController(),
        builder: (CartController c) {
          return Row(
            children: [
              SizedBox(
                width: 88,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image:
                            NetworkImage('$imagebaseUrl$imageUrl'),
                      ),
                    ),
                    // child: Image.asset(cart.product.images[0]),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.name,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                  ),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: "\$${cart.price}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: kPrimaryColor),
                      children: [
                        TextSpan(
                            text: " x${cart.numOfItem}",
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(
                        SizeConfig.screenWidth * 0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          minWidth: getProportionateScreenWidth(10),
                          onPressed: () {
                            cart.numOfItem++;
                            c.GetTotalPrice();
                            c.update();
                          },
                          child: Icon(Icons.add, color: kPrimaryColor),
                        ),
                        Text('${cart.numOfItem}',
                            style: Theme.of(context).textTheme.bodyText1),
                        MaterialButton(
                          minWidth: getProportionateScreenWidth(10),
                          onPressed: () {
                            if (cart.numOfItem == 1)
                              cart.numOfItem = 1;
                            else {
                              cart.numOfItem--;
                              c.GetTotalPrice();
                              c.update();
                            }
                          },
                          child: Icon(Icons.remove, color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
