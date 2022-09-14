import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'image.dart';

class Data {
  final int id;
  final String color;
  final int product_id;
  final String created_at;
  final String updated_at;
  final List<Image> image;
  Data({
    required this.id,
    required this.color,
    required this.product_id,
    required this.created_at,
    required this.updated_at,
    required this.image,
  });

  Data copyWith({
    int? id,
    String? color,
    int? product_id,
    String? created_at,
    String? updated_at,
    List<Image>? image,
  }) {
    return Data(
      id: id ?? this.id,
      color: color ?? this.color,
      product_id: product_id ?? this.product_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'color': color,
      'product_id': product_id,
      'created_at': created_at,
      'updated_at': updated_at,
      'image': image.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id']?.toInt() ?? 0,
      color: map['color'] ?? '',
      product_id: map['product_id']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      image: List<Image>.from(map['image']?.map((x) => Image.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, color: $color, product_id: $product_id, created_at: $created_at, updated_at: $updated_at, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
      other.id == id &&
      other.color == color &&
      other.product_id == product_id &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      listEquals(other.image, image);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      color.hashCode ^
      product_id.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      image.hashCode;
  }
}