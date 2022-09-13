import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ecommerce/Controller/CartController/cartController.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/Cart.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

var _controller = Get.put(CartController());

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

var demoCarts = _controller.cartItems.value;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    _controller.GetTotalPrice();
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(children: [
        SizedBox(
          height: getProportionateScreenWidth(SizeConfig.screenHeight * .6),
          child: ListView.builder(
              itemCount: demoCarts.length,
              itemBuilder: (context, index) {
                print(demoCarts[index].product.price);

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(demoCarts[index].product.id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        demoCarts.removeAt(index);
                      });
                    },
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: CartCard(cart: demoCarts[index]),
                  ),
                );
              }),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        SizedBox(
          width: getProportionateScreenWidth(SizeConfig.screenWidth),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_controller.totalPrice.value.toStringAsFixed(3)}',
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
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        SizedBox(
          height: getProportionateScreenHeight(50),
          child: MaterialButton(
            onPressed: () {},
            child: Center(
              child: Text(
                'ارسال الفاتورة',
                textDirection: TextDirection.rtl,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            color: kPrimaryColor,
          ),
        )
      ]),
    );
  }
}
