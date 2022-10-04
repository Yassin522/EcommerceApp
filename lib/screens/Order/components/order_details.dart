import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../models/Order_admin.dart';
import '../../../../models/order_details.dart';
import '../../../../size_config.dart';

class OrderDetailsCard extends StatelessWidget {
  OrderDetailsCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderDetail order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(5)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage('$imagebaseUrl${order.image}'),
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
              '${order.quantity.toString()} العدد',
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 5),
            Text(
              order.current_price.toString(),
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
          ],
        ),
      ],
    );
  }
}
