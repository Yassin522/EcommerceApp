import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/components/product_card.dart';
import 'package:ecommerce/models/Product.dart';

import '../../../size_config.dart';
import '../hpme_controller.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  var _controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "جميع المنتجات", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GetBuilder(
              init: HomeController(),
              builder: (_) {
                return FutureBuilder(
                  future: _controller.loadProducts(),
                  builder: ((context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: Text('Loading...'));
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
                        : Row(
                            children: [
                              ...List.generate(
                                _controller.productss.length,
                                (index) {
                                  return ProductCard(
                                      product: _controller.productss[index]);
                                },
                              ),
                              SizedBox(width: getProportionateScreenWidth(20)),
                            ],
                          );
                  }),
                );
              }),
        )
      ],
    );
  }
}
