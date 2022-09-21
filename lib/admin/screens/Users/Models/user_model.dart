// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../../models/data.dart';

class UserModel {
  List<Data>? data;
  String? message;
  String? statusCode;
  UserModel({
    this.data,
    this.message,
    this.statusCode,
  });

  UserModel copyWith({
    List<Data>? data,
    String? message,
    String? statusCode,
  }) {
    return UserModel(
      data: data ?? this.data,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data!.map((x) => x.toMap()).toList(),
      'message': message,
      'statusCode': statusCode,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      data: map['data'] != null
          ? List<Data>.from(
              map['data'].map<Data?>(
                (x) => Data.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      message: map['message'] != null ? map['message'] as String : null,
      statusCode:
          map['statusCode'] != null ? map['statusCode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserModel(data: $data, message: $message, statusCode: $statusCode)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.data, data) &&
        other.message == message &&
        other.statusCode == statusCode;
  }

  @override
  int get hashCode => data.hashCode ^ message.hashCode ^ statusCode.hashCode;
}
