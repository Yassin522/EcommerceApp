// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ecommerce/admin/screens/Users/Models/data.dart';

import '../../../../models/data.dart';

class UsersModel {
  List<UserData>? data;
  String? message;
  String? status_code;
  UsersModel({
    this.data,
    this.message,
    this.status_code,
  });

  UsersModel copyWith({
    List<UserData>? data,
    String? message,
    String? status_code,
  }) {
    return UsersModel(
      data: data ?? this.data,
      message: message ?? this.message,
      status_code: status_code ?? this.status_code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data!.map((x) => x.toMap()).toList(),
      'message': message,
      'status_code': status_code,
    };
  }

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      data: map['data'] != null
          ? List<UserData>.from(
              (map['data'] as List).map<UserData?>(
                (x) => UserData.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      message: map['message'] != null ? map['message'] as String : null,
      status_code: map['status_code'] != null
          ? map['status_code'].toString() as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersModel.fromJson(String source) =>
      UsersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UsersModel(data: $data, message: $message, status_code: $status_code)';

  @override
  bool operator ==(covariant UsersModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.data, data) &&
        other.message == message &&
        other.status_code == status_code;
  }

  @override
  int get hashCode => data.hashCode ^ message.hashCode ^ status_code.hashCode;
}
