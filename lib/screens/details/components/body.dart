import 'package:ecommerce/models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/size_config.dart';
import 'package:get/get.dart';

import '../../cart/cartController.dart';
import '../../cart/cart_screen.dart';
import '../details_controller.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

//final controller = Get.find<DetailController>();

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: 
                        GetBuilder(
            init: DetailController(),
            builder: (DetailController c) {
                       return  DefaultButton(
                                text: "Add To Cart",
                                press: () {
                                  print("adddddddddddd");
                                  print(c.numbersofProducts.value);
                              print(c.initprice.value);
                              print(c.selectedImage.value);
                                  myItems.add(
                                    Cart(
                                      numOfItem:
                                        c.numbersofProducts.value,
                                      name: product.name!,
                                      price: c.initprice.value,
                                      product_id: product.id!,
                                      image: c.productImages[c.selectedImage.value].image!,
                                    ),
                                  );
                              
                                },
                              );
            }
                        )
                            
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
