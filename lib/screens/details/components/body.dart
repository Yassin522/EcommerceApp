import 'package:ecommerce/models/Cart.dart';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../cart/cartController.dart';
import '../../cart/cart_screen.dart';
import '../details_controller.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  Body({Key? key, required this.product}) : super(key: key);
  final c = Get.find<DetailController>();
  var cartController = Get.find<CartController>();
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
                        child: GlobalUserInfo.user!.role_id == '2'
                            ? GetBuilder(
                                init: DetailController(),
                                builder: (_) {
                                  return DefaultButton(
                                    text: "?????????? ??????????",
                                    press: () {
                                      if (c.ok.value == true) {
                                        print("adddddddddddd");
                                        print(c.numbersofProducts.value);
                                        print(c.initprice.value);
                                        print(c.selectedImage.value);
                                        print(c
                                            .productImages[
                                                c.selectedImage.value]
                                            .productColorId!);

                                        myItems.add(
                                          Cart(
                                            numOfItem:
                                                c.numbersofProducts.value,
                                            name: product.name!,
                                            price: product.price!,
                                            product_id: c
                                                .productImages[
                                                    c.selectedImage.value]
                                                .productColorId!,
                                            image: c
                                                .productImages[
                                                    c.selectedImage.value]
                                                .image!,
                                          ),
                                        );
                                       
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text("???? ?????????? ???????????? ??????????"),
                                        ));
                                      }
                                    },
                                  );
                                })
                            : SizedBox(height: 1),
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
