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
<<<<<<< HEAD
        GetBuilder(
            init: HomeController(),
            builder: (HomeController c) {
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
=======
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
>>>>>>> 18a4f3bac29737ad615d71b4d40f8495d6eeb343
      ],
    );
  }
}
