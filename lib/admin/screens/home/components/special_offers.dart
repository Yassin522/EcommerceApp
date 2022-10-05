import 'dart:io';
import 'dart:typed_data';

import 'package:ecommerce/admin/screens/home/components/category_card.dart';
import 'package:ecommerce/admin/screens/home/components/category_controller.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/screens/search/product_for_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../size_config.dart';
import '../home_controller.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  SpecialOffers({
    Key? key,
  }) : super(key: key);
  final c = Get.find<AdminHomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GetBuilder(
                  init: AdminCategoryController(),
                  builder: (_) {
                    return IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                            backgroundColor: Colors.white,
                            title: 'اضافة نوع منجات جديد',
                            contentPadding: EdgeInsets.all(20),
                            content: GetBuilder(
                                init: AdminHomeController(),
                                builder: (AdminHomeController c) {
                                  return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          onChanged: (value) {},
                                          controller: c.categoryNameController,
                                          keyboardType: TextInputType.text,
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            labelText: 'اسم النوع',
                                            hintMaxLines: 1,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(20),
                                        ),
                                        Stack(
                                          children: [
                                            c.imagefile.value.path != 'nothing'
                                                ? Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors.white),
                                                      image: DecorationImage(
                                                        image: FileImage(File(c
                                                            .imagefile
                                                            .value
                                                            .path)),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: kPrimaryColor),
                                                    ),
                                                    child: Image(
                                                      image: AssetImage(
                                                          'assets/images/tuna-casserole-tin-can-canning-canned-fish-tuna-sandwich-aadc672d1f2eeb40b6686f80d2e01eca.png'),
                                                    ),
                                                  ),
                                            Positioned(
                                              bottom: -10,
                                              top: 55,
                                              left: 65,
                                              child: Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: kPrimaryColor),
                                                    color: kPrimaryColor),
                                                child: IconButton(
                                                  onPressed: () {
                                                    c.selectImage();
                                                  },
                                                  icon: const Icon(
                                                    Icons.camera_alt,
                                                    size: 17,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(20),
                                        ),
                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  if (c.imagefile.value.path ==
                                                      'nothing') {
                                                    c.showSnackBar(
                                                        'Please select a file',
                                                        context);
                                                  } else {
                                                    c.addcategory();
                                                  }

                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 110,
                                                  color: kPrimaryColor,
                                                  child: Center(
                                                    child: Text(
                                                      'submit',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 110,
                                                  color: Colors.white,
                                                  child: Center(
                                                    child: Text(
                                                      'cancel',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]);
                                }),
                            radius: 10.0);
                      },
                      icon: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    );
                  }),
              SizedBox(width: getProportionateScreenWidth(15)),
              SectionTitle(
                title: "الأقسام",
                press: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GetBuilder(
              init: AdminHomeController(),
              builder: (AdminHomeController controller) {
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
                                  'لا توجد فئات حالياً',
                                ),
                              ),
                            )
                          : Row(
                              children: List.generate(
                                controller.categories.length,
                                (index) => SpecialOfferCard(
                                  image: controller.categories[index].image,
                                  category: controller.categories[index].name,
                                  id: controller.categories[index].id,
                                  press: () {
                                    print('Yes is it');
                                    print(controller.categories[index].id);
                                    Get.toNamed(
                                      AppPages.cateSearch,
                                      parameters: {
                                        'id': controller
                                            .categories.value[index].id
                                            .toString(),
                                        'name': controller
                                            .categories.value[index].name,
                                      },
                                    );
                                  },
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
