import 'package:ecommerce/admin/screens/Order/components/body.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/components/coustom_bottom_nav_bar.dart';
import 'package:ecommerce/enums.dart';

class AdminOrdersScreen extends StatelessWidget {
  static String routeName = "/orders";

  const AdminOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.oreders),
    );
  }
}