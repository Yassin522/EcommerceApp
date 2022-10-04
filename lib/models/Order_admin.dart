import 'package:flutter/material.dart';

class OrderAdmin {
  int? id;
  String? date;
  String? status;
  String? total_price;
  int? user_id;
  String? created_at;
  String? updated_at;
  String? username;
  String? marketname;
  int? userphone;

  OrderAdmin({
    required this.id,
    required this.date,
    required this.status,
    required this.total_price,
    required this.user_id,
    required this.created_at,
    required this.updated_at,
    required this.username,
    required this.marketname,
    required this.userphone,
  });

  OrderAdmin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    status = json['status'];
    total_price = json['total_price'];
    status = json['status'];
    user_id = json['user_id'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    username = json['user'][0]['name_user'];
    marketname = json['user'][0]['name_market'];
    userphone = json['user'][0]['number_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['status'] = this.status;
    data['total_price'] = this.total_price;
    data['status'] = this.status;
    data['user_id'] = this.user_id;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;

    return data;
  }
}
