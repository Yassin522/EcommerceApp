import 'package:flutter/material.dart';
import 'package:ecommerce/components/coustom_bottom_nav_bar.dart';
import 'package:ecommerce/enums.dart';

class OrdersScreen extends StatelessWidget {
  static String routeName = "/orders";

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Orders'),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.oreders),
    );
  }
}
