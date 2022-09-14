import 'dart:convert';

class Image {
  final int id;
  final String image;
  final int product_color_id;
  final String created_at;
  final String updated_at;
  Image({
    required this.id,
    required this.image,
    required this.product_color_id,
    required this.created_at,
    required this.updated_at,
  });

  Image copyWith({
    int? id,
    String? image,
    int? product_color_id,
    String? created_at,
    String? updated_at,
  }) {
    return Image(
      id: id ?? this.id,
      image: image ?? this.image,
      product_color_id: product_color_id ?? this.product_color_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'product_color_id': product_color_id,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      id: map['id']?.toInt() ?? 0,
      image: map['image'] ?? '',
      product_color_id: map['product_color_id']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Image(id: $id, image: $image, product_color_id: $product_color_id, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Image &&
      other.id == id &&
      other.image == image &&
      other.product_color_id == product_color_id &&
      other.created_at == created_at &&
      other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      image.hashCode ^
      product_color_id.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
  }
}