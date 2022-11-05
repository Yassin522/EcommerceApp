import 'package:ecommerce/admin/screens/home/home_controller.dart';
import 'package:ecommerce/admin/screens/search/search_screen.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/screens/home/components/icon_btn_with_counter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants.dart';

import '../../../../size_config.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        child: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.size.height * .35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: getProportionateScreenHeight(180),
                        width: getProportionateScreenWidth(180),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: getProportionateScreenHeight(75),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'اسم التطبيق',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.size.height * .5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DrawerOption(
                        label: 'معلومات المتجر',
                        press: () {
                          Get.toNamed(AppPages.settings);
                        },
                      ),
                      DrawerOption(
                        label: 'طلباتي',
                        press: () {
                          Get.toNamed(AppPages.orderdetails);
                        },
                      ),
                      DrawerOption(
                        label: 'تسجيل الخروج',
                        press: () async {
                          var _controller = Get.find<AdminHomeController>();
                          EasyLoading.show(dismissOnTap: true);
                          var result = await _controller.logout();
                          if (result == true) {
                            EasyLoading.showSuccess('Done');
                            GetStorage().erase();
                            Get.toNamed(AppPages.signin);
                          } else {
                            EasyLoading.showError(
                                'هناك خطأ ما, الرجاء الحاولة مرة أخرى');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
          leadingWidth: getProportionateScreenWidth(120),
          leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: kPrimaryColor,
                    ),
                  ),
                  IconBtnWithCounter(
                    svgSrc: "assets/icons/Bell.svg",
                    numOfitem: 3,
                    press: () {},
                  ),
                ],
              )),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchPage());
                },
                icon: const Center(
                  child: Icon(
                    Icons.search,
                    color: kPrimaryColor,
                    size: 25,
                  ),
                )),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            // HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(40)),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    ));
  }
}

class DrawerOption extends StatelessWidget {
  const DrawerOption({
    Key? key,
    this.label,
    this.press,
  }) : super(key: key);
  final label;
  final press;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: press,
          child: Container(
            height: getProportionateScreenHeight(100),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  label.toString(),
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
