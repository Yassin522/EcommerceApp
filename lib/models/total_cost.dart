import 'package:flutter/material.dart';



class TotalModel {
 
  var totalc;

  TotalModel({
   
     required this.totalc,
 
     });

 TotalModel.fromJson(Map<String, dynamic> json) {
    totalc = json['id'];
  }

}

// Demo data for our cart


