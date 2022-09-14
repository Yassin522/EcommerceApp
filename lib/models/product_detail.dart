import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'data.dart';

class ProductDetails {
  final List<Data> data;
  final String message;
  final int status_code;
  ProductDetails({
    required this.data,
    required this.message,
    required this.status_code,
  });

  ProductDetails copyWith({
    List<Data>? data,
    String? message,
    int? status_code,
  }) {
    return ProductDetails(
      data: data ?? this.data,
      message: message ?? this.message,
      status_code: status_code ?? this.status_code,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'message': message,
      'status_code': status_code,
    };
  }

  factory ProductDetails.fromMap(Map<String, dynamic> map) {
    return ProductDetails(
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
      message: map['message'] ?? '',
      status_code: map['status_code']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetails.fromJson(String source) => ProductDetails.fromMap(json.decode(source));

  @override
  String toString() => 'ProductDetails(data: $data, message: $message, status_code: $status_code)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductDetails &&
      listEquals(other.data, data) &&
      other.message == message &&
      other.status_code == status_code;
  }

  @override
  int get hashCode => data.hashCode ^ message.hashCode ^ status_code.hashCode;
}