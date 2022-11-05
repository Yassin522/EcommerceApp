import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ecommerce/screens/cart/cartController.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/Cart.dart';

import '../../../size_config.dart';
import '../cart_screen.dart';
import 'cart_card.dart';

var _controller = Get.put(CartController());

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //c.GetTotalPrice();
    return FutureBuilder(
      future: c.GetTotalPrice(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(children: [
            _controller.myItems.length != 0
                ? GetBuilder(
                    init: CartController(),
                    builder: (_) {
                      return SizedBox(
                        height: getProportionateScreenWidth(
                            SizeConfig.screenHeight * .6),
                        child: ListView.builder(
                            itemCount: myItems.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Dismissible(
                                  key:
                                      Key(myItems[index].product_id.toString()),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction) {
                                    _controller.removeItem(index);
                                  },
                                  background: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFE6E6),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        SvgPicture.asset(
                                            "assets/icons/Trash.svg"),
                                      ],
                                    ),
                                  ),
                                  child: CartCard(
                                    cart: myItems[index],
                                    imageUrl: myItems[index].image,
                                  ),
                                ),
                              );
                            }),
                      );
                    })
                : SizedBox(
                    height: getProportionateScreenWidth(
                        SizeConfig.screenHeight * .6),
                    child: Center(child: Text("لايوجد منتجات في السلة")),
                  ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SizedBox(
              width: getProportionateScreenWidth(SizeConfig.screenWidth),
              child: Center(
                child: GetBuilder(
                    init: CartController(),
                    builder: (CartController c) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${c.totalPrice.value.toStringAsFixed(3)} ل.س',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'السعر الإجمالي: ',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
              child: MaterialButton(
                onPressed: () {
                  c.addorder(myItems);
                },
                child: Center(
                  child: Text(
                    'ارسال الطلبية',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                color: kPrimaryColor,
              ),
            )
          ]),
        );
      },
    );
  }
}
