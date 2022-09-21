import 'package:ecommerce/admin/screens/Users/components/body.dart';
import 'package:ecommerce/admin/screens/Users/users_controller.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/coustom_bottom_nav_bar.dart';
import '../../../enums.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.cart),
      ),
    );
  }
}
