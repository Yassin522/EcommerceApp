import 'package:ecommerce/admin/screens/Order/components/order_details.dart';
import 'package:ecommerce/admin/screens/Order/order_controller.dart';
import 'package:ecommerce/models/Order.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../models/Order_admin.dart';

class AdminOrderCard extends StatelessWidget {
  AdminOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderAdmin order;
  var c = Get.find<AdminOrderController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(
            backgroundColor: Colors.white,
            title: 'تفاصيل الطلب',
            contentPadding: EdgeInsets.all(10),
            content: GetBuilder(
                init: AdminOrderController(),
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
                                height: Get.height * 0.7,
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
            width: 60,
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
                style: TextStyle(color: Colors.black, fontSize: 12),
                maxLines: 2,
              ),
              SizedBox(height: 7),
              Text.rich(
                TextSpan(
                  text: "${order.total_price} ل.س",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                      fontSize: 12),
                  children: [
                    TextSpan(
                        text: " x${order.status}",
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              SizedBox(height: 7),
              Text(
                '${order.username!}, ${order.marketname!}',
                style: TextStyle(color: Colors.black, fontSize: 12),
                maxLines: 2,
              ),
              SizedBox(height: 7),
              Text(
                order.userphone.toString(),
                style: TextStyle(color: Colors.black, fontSize: 12),
                maxLines: 2,
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
            ],
          ),
          SizedBox(
            width: getProportionateScreenHeight(35),
          ),
          order.status != '1'
              ? Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                            backgroundColor: Colors.white,
                            title: 'هل تريد قبول الطلب ؟',
                            contentPadding: EdgeInsets.all(20),
                            content: GetBuilder(
                                init: AdminOrderController(),
                                builder: (_) {
                                  return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  c.acceptorder(order.id!);
                                                  c.update();

                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 110,
                                                  color: kPrimaryColor,
                                                  child: Center(
                                                    child: Text(
                                                      'تاكيد',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 110,
                                                  color: Colors.white,
                                                  child: Center(
                                                    child: Text(
                                                      'الغاء',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]);
                                }),
                            radius: 10.0);
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                            backgroundColor: Colors.white,
                            title: 'هل تريد قبول الطلب ؟',
                            contentPadding: EdgeInsets.all(20),
                            content: GetBuilder(
                                init: AdminOrderController(),
                                builder: (_) {
                                  return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  c.deleteorder(order.id!);
                                                  c.update();

                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 110,
                                                  color: kPrimaryColor,
                                                  child: Center(
                                                    child: Text(
                                                      'تاكيد',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 110,
                                                  color: Colors.white,
                                                  child: Center(
                                                    child: Text(
                                                      'الغاء',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]);
                                }),
                            radius: 10.0);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              : IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                        backgroundColor: Colors.white,
                        title: 'هل تريد قبول الطلب ؟',
                        contentPadding: EdgeInsets.all(20),
                        content: GetBuilder(
                            init: AdminOrderController(),
                            builder: (_) {
                              return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              c.deleteorder(order.id!);
                                              c.update();

                                              Get.back();
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 110,
                                              color: kPrimaryColor,
                                              child: Center(
                                                child: Text(
                                                  'تاكيد',
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 110,
                                              color: Colors.white,
                                              child: Center(
                                                child: Text(
                                                  'الغاء',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]);
                            }),
                        radius: 10.0);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
        ],
      ),
    );
  }
}
