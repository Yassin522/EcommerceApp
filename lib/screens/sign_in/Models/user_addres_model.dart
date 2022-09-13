// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserAddressModel {
  String? id;
  String? city;
  String? address;
  String? user_id;
  UserAddressModel({
    this.id,
    this.city,
    this.address,
    this.user_id,
  });

  UserAddressModel copyWith({
    String? id,
    String? city,
    String? address,
    String? user_id,
  }) {
    return UserAddressModel(
      id: id ?? this.id,
      city: city ?? this.city,
      address: address ?? this.address,
      user_id: user_id ?? this.user_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'city': city,
      'address': address,
      'user_id': user_id,
    };
  }

  factory UserAddressModel.fromMap(Map<String, dynamic> map) {
    return UserAddressModel(
      id: map['id'] != null ? map['id'].toString() as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      user_id:
          map['user_id'] != null ? map['user_id'].toString() as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddressModel.fromJson(String source) =>
      UserAddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserAddressModel(id: $id, city: $city, address: $address, user_id: $user_id)';
  }

  @override
  bool operator ==(covariant UserAddressModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.city == city &&
        other.address == address &&
        other.user_id == user_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^ city.hashCode ^ address.hashCode ^ user_id.hashCode;
  }
}
