import 'package:ecommerce/admin/screens/Order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../size_config.dart';
import 'order_cart.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

var c = Get.find<AdminOrderController>();

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    print("mnorrrrrrrrrrrrrrrrrrr");
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(children: [
        GetBuilder(
            init: AdminOrderController(),
            builder: (_) {
              return FutureBuilder(
                  future: c.loadOrders(),
                  builder: ((context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: Text('Loading...'));
                    }

                    return c.orders.isEmpty
                        ? const SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                'لا يوجد طلبات',
                              ),
                            ),
                          )
                        : SizedBox(
                            height: getProportionateScreenWidth(
                                SizeConfig.screenHeight * .78),
                            child: ListView.builder(
                                itemCount: c.orders.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: AdminOrderCard(
                                      order: c.orders[index],
                                    ),
                                  );
                                }),
                          );
                  }));
            }),
      ]),
    );
  }
}
