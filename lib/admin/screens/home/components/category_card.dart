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
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
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
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(color: Colors.white),
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
                      ),
                      IconButton(
                          onPressed: () {
                            print("ok");
                            Get.defaultDialog(
                                backgroundColor: Colors.white,
                                title: 'هل تريد بالتاكيد الحذف؟',
                                contentPadding: EdgeInsets.all(20),
                                content: GetBuilder(
                                    init: AdminHomeController(),
                                    builder: (_) {
                                      return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
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
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red.shade900,
                          )),
                    ],
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
