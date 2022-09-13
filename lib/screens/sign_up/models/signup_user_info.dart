// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpModel {
  String? first_name;
  String? last_name;
  String? phone;
  String? email;
  String? password;
  String? address;
  SignUpModel({
    this.first_name,
    this.last_name,
    this.phone,
    this.email,
    this.password,
    this.address,
  });
  SignUpModel copyWith({
    String? first_name,
    String? last_name,
    String? phone,
    String? email,
    String? password,
    String? address,
  }) {
    return SignUpModel(
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': first_name,
      'last_name': last_name,
      'phone': phone,
      'email': email,
      'password': password,
      'address': address,
    };
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      first_name:
          map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) =>
      SignUpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignUpModel(first_name: $first_name, last_name: $last_name, phone: $phone, email: $email, password: $password, address: $address)';
  }

  @override
  bool operator ==(covariant SignUpModel other) {
    if (identical(this, other)) return true;

    return other.first_name == first_name &&
        other.last_name == last_name &&
        other.phone == phone &&
        other.email == email &&
        other.password == password &&
        other.address == address;
  }

  @override
  int get hashCode {
    return first_name.hashCode ^
        last_name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        password.hashCode ^
        address.hashCode;
  }
}
