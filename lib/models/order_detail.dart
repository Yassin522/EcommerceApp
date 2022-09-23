import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'data_2.dart';

class OrderDetail {
  final List<Data2> data;
  final String message;
  final int status_code;
  OrderDetail({
    required this.data,
    required this.message,
    required this.status_code,
  });

  OrderDetail copyWith({
    List<Data2>? data,
    String? message,
    int? status_code,
  }) {
    return OrderDetail(
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

  factory OrderDetail.fromMap(Map<String, dynamic> map) {
    return OrderDetail(
      data: List<Data2>.from(map['data']?.map((x) => Data2.fromMap(x))),
      message: map['message'] ?? '',
      status_code: map['status_code']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetail.fromJson(String source) => OrderDetail.fromMap(json.decode(source));

  @override
  String toString() => 'OrderDetail(data: $data, message: $message, status_code: $status_code)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OrderDetail &&
      listEquals(other.data, data) &&
      other.message == message &&
      other.status_code == status_code;
  }

  @override
  int get hashCode => data.hashCode ^ message.hashCode ^ status_code.hashCode;
}