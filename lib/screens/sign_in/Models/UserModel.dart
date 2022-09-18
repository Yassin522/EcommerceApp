// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ecommerce/screens/sign_in/Models/user_addres_model.dart';
import 'package:ecommerce/screens/sign_in/Models/user_info.dart';

class UserModel {
  String? access_token;
  String? token_type;
  String? expires_in;
  UserInfo? user;
  List<UserAddressModel>? address;
  UserModel({
    this.access_token,
    this.token_type,
    this.expires_in,
    this.user,
    this.address,
  });

  UserModel copyWith({
    String? access_token,
    String? token_type,
    String? expires_in,
    UserInfo? user,
    List<UserAddressModel>? address,
  }) {
    return UserModel(
      access_token: access_token ?? this.access_token,
      token_type: token_type ?? this.token_type,
      expires_in: expires_in ?? this.expires_in,
      user: user ?? this.user,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': access_token,
      'token_type': token_type,
      'expires_in': expires_in,
      'user': user?.toMap(),
      'address': address!.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    print('############');
    if (map['user'] != null) print(map['user']['name_user']!.toString());
    return UserModel(
      access_token:
          map['access_token'] != null ? map['access_token'] as String : null,
      token_type:
          map['token_type'] != null ? map['token_type'] as String : null,
      expires_in: map['expires_in'] != null
          ? map['expires_in'].toString() as String
          : null,
      user: map['user'] != null
          ? UserInfo.fromMap(map['user'] as Map<String, dynamic>)
          : null,
      address: map['address'] != null
          ? List<UserAddressModel>.from(
              (map['address']).map<UserAddressModel?>(
                (x) => UserAddressModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(access_token: $access_token, token_type: $token_type, expires_in: $expires_in, user: $user, address: $address)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.access_token == access_token &&
        other.token_type == token_type &&
        other.expires_in == expires_in &&
        other.user == user &&
        listEquals(other.address, address);
  }

  @override
  int get hashCode {
    return access_token.hashCode ^
        token_type.hashCode ^
        expires_in.hashCode ^
        user.hashCode ^
        address.hashCode;
  }
}
