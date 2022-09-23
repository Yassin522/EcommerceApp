// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore: file_names
class AddProductModel {
  String? name;
  var image;
  String? description;
  String? size;
  double? price;
  String? category_id;
  AddProductModel({
    this.name,
    this.image,
    this.description,
    this.size,
    this.price,
    this.category_id,
  });

  AddProductModel copyWith({
    String? name,
    var image,
    String? description,
    String? size,
    double? price,
    String? category_id,
  }) {
    return AddProductModel(
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      size: size ?? this.size,
      price: price ?? this.price,
      category_id: category_id ?? this.category_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image.toMap(),
      'description': description,
      'size': size,
      'price': price,
      'category_id': category_id,
    };
  }

  factory AddProductModel.fromMap(Map<String, dynamic> map) {
    return AddProductModel(
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      size: map['size'] != null ? map['size'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      category_id:
          map['category_id'] != null ? map['category_id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddProductModel.fromJson(String source) =>
      AddProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddProductModel(name: $name, image: $image, description: $description, size: $size, price: $price, category_id: $category_id)';
  }

  @override
  bool operator ==(covariant AddProductModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.image == image &&
        other.description == description &&
        other.size == size &&
        other.price == price &&
        other.category_id == category_id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        description.hashCode ^
        size.hashCode ^
        price.hashCode ^
        category_id.hashCode;
  }
}
