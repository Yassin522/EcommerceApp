import 'package:ecommerce/Controller/CartController/HomeController/homeController.dart';
import 'package:ecommerce/models/product_color.dart';
import 'package:ecommerce/screens/details/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

final HomeController controller = Get.find<HomeController>();

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
  int selectedImage = 0;
  final controller = Get.put(DetailController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.loadProductColors(widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.loadProductColors(widget.product.id),
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
                            'http://192.168.43.86:8000${controller.productImages[selectedImage].image}'),
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

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
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
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image(
          image: NetworkImage(
              'http://192.168.43.86:8000${controller.productImages[index].image}'),
        ),
      ),
    );
  }
}
