import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ecommerce/screens/home/hpme_controller.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: GetBuilder(
          init: HomeController(),
          builder: (HomeController c) {
            return FutureBuilder(
              future: c.loadCategories(),
              builder: ((context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Loading...'));
                }
                 
                  return c.categories.isEmpty
                                  ? const SizedBox(
                                      height: 50,
                                      child: Center(
                                        child:  Text(
                                          'NO Categories',
                                        
                                        ),
                                      ),
                                    )
                                  :
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    c.categories.length,
                    (index) => CategoryCard(
                      icon: c.categories[index].image,
                      text: c.categories[index].name,
                      press: () {},
                    ),
                  ),
                );
              }),
            );
          }),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
