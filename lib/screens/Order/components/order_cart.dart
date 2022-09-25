import 'package:ecommerce/models/Order.dart';
import 'package:ecommerce/models/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../models/data_2.dart';
import '../../../size_config.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
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
                image:  DecorationImage(
                  image:
                  order.status=='1'?
                   AssetImage('assets/images/success.png')
                   :
                   AssetImage('assets/images/Wavy_Bus-12_Single-12.jpg')
                   ,
                   fit: BoxFit.cover
                ),
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
    );
  }
}
