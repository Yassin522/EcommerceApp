import 'package:ecommerce/admin/screens/Order/components/body.dart';
import 'package:ecommerce/admin/screens/Order/components/order_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/components/coustom_bottom_nav_bar.dart';
import 'package:ecommerce/enums.dart';

import '../../../constants.dart';

class AdminOrdersScreen extends StatelessWidget {
  static String routeName = "/orders";

  const AdminOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('كل الطلبات'),
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: OrderSearchScreen());
              },
              icon: const Center(
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                ),
              )),
        ],
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.oreders),
    );
  }
}
