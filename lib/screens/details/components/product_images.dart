import 'package:ecommerce/Controller/CartController/HomeController/homeController.dart';
import 'package:ecommerce/models/product_color.dart';
import 'package:ecommerce/screens/details/details_controller.dart';
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
  final controller = Get.find<DetailController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return 
    GetBuilder(
            init: DetailController(),
            builder: (DetailController c) {
   return FutureBuilder(
        future: c.loadProductColors(widget.product.id),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Loading...'));
          }

          return Column(
            children: [
              SizedBox(
                width: getProportionateScreenWidth(238),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Hero(
                      tag: widget.product.id.toString(),
                      child: Image(
                        image: NetworkImage(
                            '$imagebaseUrl${controller.productImages[controller.selectedImage.value].image}'),
                      )),
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(controller.productImages.length,
                        (index) => buildSmallProductPreview(index)),
                  ],
                ),
              )
            ],
          );
        }));
            }
    );




  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        controller.selectedImage.value = index;
        controller.update();
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
              color: kPrimaryColor.withOpacity(
                  controller.selectedImage.value == index ? 1 : 0)),
        ),
        child: Image(
          image: NetworkImage(
              '$imagebaseUrl${controller.productImages[index].image}'),
        ),
      ),
    );
  }
}
