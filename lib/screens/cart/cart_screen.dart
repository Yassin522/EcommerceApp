import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ecommerce/Controller/CartController/cartController.dart';
import 'package:ecommerce/models/Cart.dart';
import 'package:ecommerce/size_config.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

var _controller = Get.put(CartController());

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      //bottomNavigationBar: CheckoutCard(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.cart),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "سلة المشتريات",
              style: TextStyle(color: Colors.black),
              textDirection: TextDirection.rtl,
            ),
            Text(
              "${_controller.cartItems.length} أغراض",
              style: Theme.of(context).textTheme.caption,
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}
