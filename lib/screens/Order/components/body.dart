import 'package:ecommerce/screens/Order/order_controller.dart';
import 'package:ecommerce/screens/search/product_for_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import '../../sign_in/Models/global_user_info.dart';
import 'order_cart.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

var c = Get.find<OrderController>();

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Center(
          child: GetBuilder(
              init: OrderController(),
              builder: (_) {
                return FutureBuilder(
                    future: c.loadOrders(GlobalUserInfo.user!.id!),
                    builder: ((context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoadingWidget();
                      }
                      return c.orders.isEmpty
                          ? Center(
                              child: Text(
                                'لا يوجد طلبات',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            )
                          : SizedBox(
                              height: getProportionateScreenWidth(
                                  SizeConfig.screenHeight * .9),
                              child: ListView.builder(
                                  itemCount: c.orders.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: OrderCard(
                                        order: c.orders[index],
                                      ),
                                    );
                                  }),
                            );
                    }));
              }),
        ),
      ),
    );
  }
}
