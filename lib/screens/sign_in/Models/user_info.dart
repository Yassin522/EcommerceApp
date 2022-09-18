// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class UserInfo {
  String? name_user;
  String? id;
  String? email;
  String? name_market;
  String? number_phone;
  String? role_id;
  String? token;
  String? email_verified_at;
  String? FCM;
  UserInfo({
    this.name_user,
    this.id,
    this.email,
    this.name_market,
    this.number_phone,
    this.role_id,
    this.token,
    this.email_verified_at,
    this.FCM,
  });

  UserInfo copyWith({
    String? name_user,
    String? id,
    String? email,
    String? name_market,
    String? number_phone,
    String? role_id,
    String? token,
    String? email_verified_at,
    String? FCM,
  }) {
    return UserInfo(
      name_user: name_user ?? this.name_user,
      id: id ?? this.id,
      email: email ?? this.email,
      name_market: name_market ?? this.name_market,
      number_phone: number_phone ?? this.number_phone,
      role_id: role_id ?? this.role_id,
      token: token ?? this.token,
      email_verified_at: email_verified_at ?? this.email_verified_at,
      FCM: FCM ?? this.FCM,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name_user': name_user,
      'id': id,
      'email': email,
      'name_market': name_market,
      'number_phone': number_phone,
      'role_id': role_id,
      'token': token,
      'email_verified_at': email_verified_at,
      'FCM': FCM,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      name_user: map['name_user'] != null ? map['name_user'] as String : null,
      id: map['id'] != null ? map['id'].toString() : null,
      email: map['email'] != null ? map['email'] as String : null,
      name_market:
          map['name_market'] != null ? map['name_market'] as String : null,
      number_phone:
          map['number_phone'] != null ? map['number_phone'].toString() : null,
      role_id: map['role_id'] != null ? map['role_id'].toString() : null,
      token: map['token'] != null ? map['token'] as String : null,
      email_verified_at: map['email_verified_at'] != null
          ? map['email_verified_at'] as String
          : null,
      FCM: map['FCM'] != null ? map['FCM'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfo(name_user: $name_user, id: $id, email: $email, name_market: $name_market, number_phone: $number_phone, role_id: $role_id, token: $token, email_verified_at: $email_verified_at, FCM: $FCM)';
  }

  @override
  bool operator ==(covariant UserInfo other) {
    if (identical(this, other)) return true;

    return other.name_user == name_user &&
        other.id == id &&
        other.email == email &&
        other.name_market == name_market &&
        other.number_phone == number_phone &&
        other.role_id == role_id &&
        other.token == token &&
        other.email_verified_at == email_verified_at &&
        other.FCM == FCM;
  }

  @override
  int get hashCode {
    return name_user.hashCode ^
        id.hashCode ^
        email.hashCode ^
        name_market.hashCode ^
        number_phone.hashCode ^
        role_id.hashCode ^
        token.hashCode ^
        email_verified_at.hashCode ^
        FCM.hashCode;
  }
}
