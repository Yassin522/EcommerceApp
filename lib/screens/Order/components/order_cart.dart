import 'package:ecommerce/models/Order.dart';
import 'package:ecommerce/screens/Order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../admin/screens/Order/components/order_details.dart';
import '../../../constants.dart';
import '../../../models/data_2.dart';
import '../../../size_config.dart';

class OrderCard extends StatelessWidget {
  OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;
  var c = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(
            backgroundColor: Colors.white,
            title: 'تفاصيل الطلب',
            contentPadding: EdgeInsets.all(10),
            content: GetBuilder(
                init: OrderController(),
                builder: (_) {
                  return FutureBuilder(
                      future: c.getOrdersDetails(order.id!),
                      builder: ((context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: Text('Loading...'));
                        }

                        return c.allOrders.isEmpty
                            ? const SizedBox(
                                height: 10,
                                child: Center(
                                  child: Text(
                                    'لا يوجد تفاصيل',
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: Get.height * 0.4,
                                width: Get.width * 0.7,
                                child: ListView.builder(
                                    itemCount: c.allOrders.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: OrderDetailsCard(
                                          order: c.allOrders[index],
                                        ),
                                      );
                                    }),
                              );
                      }));
                }),
            radius: 10.0);
      },
      child: Row(
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
                      image: order.status == '1'
                          ? AssetImage('assets/images/success.png')
                          : AssetImage(
                              'assets/images/Wavy_Bus-12_Single-12.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.date!,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "${order.total_price} ل.س",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                        text: " x${order.status}",
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
            ],
          )
        ],
      ),
    );
  }
}
