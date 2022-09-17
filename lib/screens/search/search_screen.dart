import 'dart:math';

import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/screens/details/components/body.dart';
import 'package:ecommerce/screens/home/home_service.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/hpme_controller.dart';

class SearchPage extends SearchDelegate {
  var _controller = Get.find<HomeController>();
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
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
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
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
    // TODO: implement buildResult
    var matches = _controller.productss.value;
    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (BuildContext context, int index) {
        var item = matches[index];
        print(item.name);
        return ListTile(
          title: Text(item.name.toString()),
        );
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    var sug = _controller.categories
        .value; /* [
      'Hello',
      'Hbeeeeeeeeed',
      'Ok doke',
      'Ok doke',
      'Ok doke',
      'Ok doke',
    ];*/
    return Wrap(
      textDirection: TextDirection.rtl,
      alignment: WrapAlignment.end,
      spacing: 10,
      direction: Axis.horizontal,
      children: List.generate(
        sug.length,
        (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: getProportionateScreenHeight(50),
            width: getProportionateScreenWidth(90),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
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
                    style: TextStyle(
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
    );
    throw UnimplementedError();
  }
}
