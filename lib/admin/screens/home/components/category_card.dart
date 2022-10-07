import 'package:ecommerce/admin/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class SpecialOfferCard extends StatelessWidget {
  SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.press,
    required this.id,
  }) : super(key: key);

  final String category, image;
  final GestureTapCallback press;
  final int id;

  final c = Get.find<AdminHomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        onLongPress: () {
          print("ok");
          Get.defaultDialog(
              backgroundColor: Colors.white,
              title: 'هل تريد بالتاكيد الحذف؟',
              contentPadding: EdgeInsets.all(20),
              content: GetBuilder(
                  init: AdminHomeController(),
                  builder: (_) {
                    return Column(mainAxisSize: MainAxisSize.min, children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () async {
                                c.deletecategory(id);

                                Get.back();
                              },
                              child: Container(
                                height: 40,
                                width: 110,
                                color: kPrimaryColor,
                                child: Center(
                                  child: Text(
                                    'تاكيد',
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 40,
                                width: 110,
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'الغاء',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]);
                  }),
              radius: 10.0);
        },
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenHeight(120),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image(
                    image: NetworkImage('$imagebaseUrl$image'),
                    fit: BoxFit.cover),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(5.0),
                    vertical: getProportionateScreenHeight(10),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: getProportionateScreenHeight(120) * .3,
                      width: getProportionateScreenWidth(242),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(color: Colors.grey.shade800),
                              children: [
                                TextSpan(
                                  text: "$category\n",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
