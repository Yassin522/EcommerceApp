import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/screens/home/hpme_controller.dart';
import 'package:ecommerce/screens/search/product_for_category.dart';
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
            builder: (_) {
              return FutureBuilder(
                future: _controller.loadProducts(),
                builder: ((context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingWidget();
                  }
                  return _controller.productss.isEmpty
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
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: _controller.productss.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 15,
                          ),
                          itemBuilder: (context, index) => ProductCard(
                              product: _controller.productss[index]),
                        );
                }),
              );
            })
      ],
    );
  }
}
