import 'dart:math';

import 'package:ecommerce/admin/screens/home/home_controller.dart';
import 'package:ecommerce/components/product_card.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/screens/details/components/body.dart';
import 'package:ecommerce/screens/home/home_service.dart';
import 'package:ecommerce/screens/search/product_for_category.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends SearchDelegate {
  var _controller = Get.find<AdminHomeController>();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    var matches = _controller.productss.value;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 240,
          mainAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          var item = matches[0];
          return SizedBox(height: 200, child: ProductCard(product: item));
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var sug = query.isEmpty
        ? _controller.categories.value
        : _controller.productss.value
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return query.isEmpty
        ? Wrap(
            textDirection: TextDirection.rtl,
            alignment: WrapAlignment.end,
            spacing: 10,
            direction: Axis.horizontal,
            children: List.generate(
              sug.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    print('id is :' + sug[index].id.toString());
                    Get.toNamed(AppPages.cateSearch,
                        parameters: {'id': sug[index].id.toString()});
                  },
                  child: Container(
                    height: getProportionateScreenHeight(50),
                    width: getProportionateScreenWidth(90),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: Color.fromARGB(
                        255,
                        Random().nextInt(150),
                        Random().nextInt(150),
                        Random().nextInt(150),
                      ),
                    ),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            sug[index].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 240,
                mainAxisSpacing: 10,
              ),
              itemCount: sug.length,
              itemBuilder: (BuildContext context, int index) {
                var item = sug[index];
                return SizedBox(height: 200, child: ProductCard(product: item));
              },
            ),
          );
  }
}
