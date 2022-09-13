import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';
import 'details_controller.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return GetBuilder(
        init: DetailController(),
        builder: (DetailController c) {
          return FutureBuilder(
              future: c.loadProductColors(agrs.product.id),
              builder: ((context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Loading...'));
                }

                return c.productcolors.isEmpty
                    ? const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'يرجى المحاولة لاحقاً',
                          ),
                        ),
                      )
                    : Scaffold(
                        backgroundColor: Color(0xFFF5F6F9),
                        appBar: PreferredSize(
                          preferredSize:
                              Size.fromHeight(AppBar().preferredSize.height),
                          child: CustomAppBar(),
                        ),
                        body: Body(product: agrs.product),
                      );
              }));
        });
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
