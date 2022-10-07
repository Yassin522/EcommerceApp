import 'package:ecommerce/components/product_card.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/search/search_controller.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsOfCategory extends StatelessWidget {
  ProductsOfCategory({Key? key}) : super(key: key);
  var _controller = Get.find<SearchController>();
  var data = Get.parameters;

  @override
  Widget build(BuildContext context) {
    print('id is ' + data['id'].toString());
    _controller.id = data['id'].toString();
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          data['name'].toString(),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.end,
        ),
      ),*/
      body: Column(
        children: [
          Container(
            height: getProportionateScreenHeight(100),
            width: Get.size.width,
            color: Colors.blueGrey,
            child: Text(
              data['name'].toString(),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.end,
            ),
          ),
          FutureBuilder(
            future: _controller.getProductsFotCateegory(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingWidget();
              } else if (_controller.products.length == 0) {
                return Center(
                  child: Text('لا توجد منتجات لعرضها'),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 240,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _controller.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = _controller.products[index];
                      return SizedBox(
                          height: 200, child: ProductCard(product: item));
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('الرجاء الإنتظار ...'),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
