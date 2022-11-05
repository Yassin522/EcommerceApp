import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/search/product_for_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import '../hpme_controller.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "الأقسام",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GetBuilder(
              init: HomeController(),
              builder: (HomeController controller) {
                return FutureBuilder(
                    future: controller.loadCategories(),
                    builder: ((context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoadingWidget();
                      }

                      return controller.categories.isEmpty
                          ? const SizedBox(
                              height: 50,
                              child: Center(
                                child: Text(
                                  'لا يوجد تصنيفات',
                                ),
                              ),
                            )
                          : Row(
                              children: List.generate(
                                controller.categories.length,
                                (index) => SpecialOfferCard(
                                  image: controller.categories[index].image,
                                  category: controller.categories[index].name,
                                  press: () {},
                                ),
                              ),
                            );
                    }));
              }),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenHeight(120),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image(
                    image: NetworkImage('$imagebaseUrl$image'),
                    fit: BoxFit.cover),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(5.0),
                    vertical: getProportionateScreenHeight(10),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: getProportionateScreenHeight(120) * .3,
                      width: getProportionateScreenWidth(242),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(color: Colors.grey.shade800),
                              children: [
                                TextSpan(
                                  text: "$category\n",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
