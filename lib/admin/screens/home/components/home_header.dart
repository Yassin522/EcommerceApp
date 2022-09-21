import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/search/search_screen.dart';

import 'icon_btn_with_counter.dart';
import 'search_field.dart';

var _def = const Icon(
  Icons.menu,
  color: kPrimaryColor,
  size: 25,
);

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
          leading: IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchPage());
                },
                icon: const Center(
                  child: Icon(
                    Icons.search,
                    color: kPrimaryColor,
                    size: 25,
                  ),
                )),
          ]),
    );

    /* Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
          Text('App Name',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w300)),
          // SearchField(),
          SizedBox(
            height: 30,
            width: 30,
            child: IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchPage());
                },
                icon: Center(
                  child: Icon(
                    Icons.search,
                    color: kPrimaryColor,
                    size: 25,
                  ),
                )),
          ),

          DropdownButton<Widget>(
              icon: _def,
              borderRadius: BorderRadius.circular(20),
              underline: SizedBox(),
              value: null,
              items: [
                DropdownMenuItem<Widget>(
                  value: _def,
                  child: Text('op1'),
                ),
                DropdownMenuItem<Widget>(
                  value: Icon(
                    Icons.menu_book,
                    color: kPrimaryColor,
                    size: 10,
                  ),
                  child: Text('op2'),
                )
              ],
              onChanged: (value) {}),
        ],
      ),
    );*/
  }
}
