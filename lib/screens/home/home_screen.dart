import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/components/coustom_bottom_nav_bar.dart';
import 'package:ecommerce/enums.dart';
import 'package:ecommerce/size_config.dart';

import '../../Controller/CartController/HomeController/homeController.dart';
import 'components/body.dart';


class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
