import 'package:ecommerce/admin/screens/Order/components/order_cart.dart';
import 'package:ecommerce/admin/screens/Order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../size_config.dart';

class OrderSearchScreen extends SearchDelegate {
  var _controller = Get.find<AdminOrderController>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var matches = _controller.allOrders.value;
    return GetBuilder(
        init: AdminOrderController(),
        builder: (_) {
          return FutureBuilder(
              future: _controller.loadOrders(),
              builder: ((context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Loading...'));
                }
                return _controller.orders.isEmpty
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
                            SizeConfig.screenHeight * .9),
                        child: ListView.builder(
                            itemCount: _controller.orders.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: AdminOrderCard(
                                  order: _controller.orders[index],
                                ),
                              );
                            }),
                      );
              }));
        });
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var sug = _controller.orders.value
        .where((element) =>
            element.marketname.toLowerCase().contains(query.toLowerCase()) ||
            element.username.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return query.isEmpty
        ? ListView.builder(
            itemCount: _controller.orders.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: AdminOrderCard(
                  order: _controller.orders.value[index],
                ),
              );
            })
        : ListView.builder(
            itemCount: sug.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: AdminOrderCard(
                  order: sug[index],
                ),
              );
            });
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
