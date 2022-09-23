import 'dart:convert';

import 'package:flutter/foundation.dart';


class Data2 {
  final int id;
  final String date;
  final String status;
  final String total_price;
  final int user_id;
  final String created_at;
  final String updated_at;
  Data2({
    required this.id,
    required this.date,
    required this.status,
    required this.total_price,
    required this.user_id,
    required this.created_at,
    required this.updated_at,
  });

  Data2 copyWith({
    int? id,
    String? date,
    String? status,
    String? total_price,
    int? user_id,
    String? created_at,
    String? updated_at,
  }) {
    return Data2(
      id: id ?? this.id,
      date: date ?? this.date,
      status: status ?? this.status,
      total_price: total_price ?? this.total_price,
      user_id: user_id ?? this.user_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'status': status,
      'total_price': total_price,
      'user_id': user_id,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Data2.fromMap(Map<String, dynamic> map) {
    return Data2(
      id: map['id']?.toInt() ?? 0,
      date: map['date'] ?? '',
      status: map['status'] ?? '',
      total_price: map['total_price'] ?? '',
      user_id: map['user_id']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data2.fromJson(String source) => Data2.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, date: $date, status: $status, total_price: $total_price, user_id: $user_id, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data2 &&
      other.id == id &&
      other.date == date &&
      other.status == status &&
      other.total_price == total_price &&
      other.user_id == user_id &&
      other.created_at == created_at &&
      other.updated_at == updated_at ;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      date.hashCode ^
      status.hashCode ^
      total_price.hashCode ^
      user_id.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ;
  }
}