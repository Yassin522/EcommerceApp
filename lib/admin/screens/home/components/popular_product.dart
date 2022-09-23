import 'package:ecommerce/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/components/product_card.dart';
import 'package:ecommerce/models/Product.dart';

import '../../../../size_config.dart';
import '../home_controller.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  var _controller = Get.find<AdminHomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed(AppPages.adminaddproudct);
                },
                icon: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              SectionTitle(title: "جميع المنتجات", press: () {}),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        GetBuilder(
            init: AdminHomeController(),
            builder: (AdminHomeController c) {
              return FutureBuilder(
                future: c.loadProducts(),
                builder: ((context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text('Loading...'));
                  }

                  return c.productss.isEmpty
                      ? const SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              'لا يوجد منتجات',
                            ),
                          ),
                        )
                      :

                      /*Row(
          children: [
            ...List.generate(
              c.productss.length,
              (index) {
        
                  return ProductCard(product: c.productss[index]);
              },
            ),
            SizedBox(width: getProportionateScreenWidth(20)),
          ],
        );*/

                      SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: c.productss.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.75,
                              crossAxisSpacing: 15,
                            ),
                            itemBuilder: (context, index) =>
                                ProductCard(product: c.productss[index]),
                          ),
                        );
                }),
              );
            })
      ],
    );
  }
}
