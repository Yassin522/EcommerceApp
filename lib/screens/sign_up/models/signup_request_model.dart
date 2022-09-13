// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpRequestModel {
  String? email;
  String? password;
  String? name_user;
  String? name_market;
  String? address;
  String? number_phone;
  String? city;
  String? fcm;
  SignUpRequestModel({
    this.email,
    this.password,
    this.name_user,
    this.name_market,
    this.address,
    this.number_phone,
    this.city,
    this.fcm,
  });

  @override
  String toString() {
    return 'SignUpRequestModel(email: $email, password: $password, name_user: $name_user, name_market: $name_market, address: $address, number_phone: $number_phone, city: $city, fcm: $fcm)';
  }
}
