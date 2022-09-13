import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/components/product_card.dart';
import 'package:ecommerce/models/Product.dart';

import '../../../size_config.dart';
import '../hpme_controller.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
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
          child:

          GetBuilder(
          init: HomeController(),
          builder: (HomeController c) {
            return
          
           FutureBuilder(
              future: c.loadProducts(),

              builder: ((context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Loading...'));
                }

                 return  c.productss.isEmpty
                                  ? const SizedBox(
                                      height: 50,
                                      child: Center(
                                        child:  Text(
                                          'لا يوجد منتجات',
                                        
                                        ),
                                      ),
                                    )
                                  :
          
           Row(
            children: [
              ...List.generate(
                c.productss.length,
                (index) {
        
                    return ProductCard(product: c.productss[index]);
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          );
              }
           ),
           );
          }
          ),



        )
      ],
    );
  }
}
