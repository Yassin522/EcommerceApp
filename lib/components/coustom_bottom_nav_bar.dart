import 'package:ecommerce/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ecommerce/screens/Order/Oreders_screen.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/profile/profile_screen.dart';
import 'package:ecommerce/screens/search/search_screen.dart';
import 'package:get_storage/get_storage.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);
  var role_id = GetStorage().read('role_id');
  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    print(selectedMenu);
    print(MenuState.cart == selectedMenu);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  iconSize: MenuState.home == selectedMenu ? 25 : 20,
                  icon: SvgPicture.asset(
                    "assets/icons/Shop Icon.svg",
                    color: MenuState.home == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    if (role_id == '1') {
                      Get.toNamed(AppPages.adminhome);
                    } else {
                      Get.toNamed(AppPages.home);
                    }
                  }),
              IconButton(
                  icon: role_id == '1'
                      ? Icon(Icons.groups_outlined)
                      : SvgPicture.asset(
                          "assets/icons/Cart Icon.svg"), //SvgPicture.asset("assets/icons/Cart Icon.svg"),
                  color: MenuState.cart == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                  iconSize: MenuState.cart == selectedMenu ? 30 : 25,
                  onPressed: role_id == '1'
                      ? () {
                          Get.toNamed(AppPages.adminusers);
                        }
                      : () {
                          Get.toNamed(AppPages.cart);
                        }),
              IconButton(
                  iconSize: MenuState.oreders == selectedMenu ? 25 : 20,
                  icon: Icon(Icons.menu_outlined),
                  color: MenuState.oreders == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                  onPressed: role_id == '1'
                      ? () {
                          Get.toNamed(AppPages.adminorder);
                        }
                      : () {
                          Get.toNamed(AppPages.orderdetails);
                        }),
              IconButton(
                  iconSize: MenuState.profile == selectedMenu ? 25 : 20,
                  icon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",
                    color: MenuState.profile == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    Get.toNamed(AppPages.profile);
                  }),
            ],
          )),
    );
  }
}
