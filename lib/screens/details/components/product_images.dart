import 'package:ecommerce/Controller/CartController/HomeController/homeController.dart';
import 'package:ecommerce/models/product_color.dart';
import 'package:ecommerce/screens/details/details_controller.dart';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  final c = Get.find<DetailController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DetailController(),
        builder: (_) {
          return FutureBuilder(
              future: c.loadProductColors(widget.product.id),
              builder: ((context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Loading...'));
                }
                return c.ok.value == true
                    ? Column(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(238),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Hero(
                                  tag: widget.product.id.toString(),
                                  child: Image(
                                    image: NetworkImage(
                                        '$imagebaseUrl${c.productImages[c.selectedImage.value].image}'),
                                  )),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenWidth(20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GlobalUserInfo.user!.role_id == '1'
                                  ? Text(
                                      'عدد ${c.productImages[c.selectedImage.value].quantity.toString()} ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: kPrimaryColor),
                                    )
                                  : SizedBox(
                                      width: getProportionateScreenWidth(1)),
                              Text(
                                c.productImages[c.selectedImage.value].name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor),
                              ),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenWidth(10)),
                          SingleChildScrollView(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(c.productImages.length,
                                    (index) => buildSmallProductPreview(index)),
                              ],
                            ),
                          )
                        ],
                      )
                    : Center(child: Text('لا يوجد نكهات'));
              }));
        });
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        c.selectedImage.value = index;
        c.update();
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor
                  .withOpacity(c.selectedImage.value == index ? 1 : 0)),
        ),
        child: Image(
          image: NetworkImage('$imagebaseUrl${c.productImages[index].image}'),
        ),
      ),
    );
  }
}
