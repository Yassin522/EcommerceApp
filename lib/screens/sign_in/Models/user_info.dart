// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class UserInfo {
  String? user_name;
  String? id;
  String? email;
  String? market_name;
  String? number_phone;
  String? role_id;
  String? token;
  String? email_verified_at;
  String? fcm;
  UserInfo({
    this.user_name,
    this.id,
    this.email,
    this.market_name,
    this.number_phone,
    this.role_id,
    this.token,
    this.email_verified_at,
    this.fcm,
  });

  UserInfo copyWith({
    String? user_name,
    String? id,
    String? email,
    String? market_name,
    String? number_phone,
    String? role_id,
    String? token,
    String? email_verified_at,
    String? fcm,
  }) {
    return UserInfo(
      user_name: user_name ?? this.user_name,
      id: id ?? this.id,
      email: email ?? this.email,
      market_name: market_name ?? this.market_name,
      number_phone: number_phone ?? this.number_phone,
      role_id: role_id ?? this.role_id,
      token: token ?? this.token,
      email_verified_at: email_verified_at ?? this.email_verified_at,
      fcm: fcm ?? this.fcm,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_name': user_name,
      'id': id,
      'email': email,
      'market_name': market_name,
      'number_phone': number_phone,
      'role_id': role_id,
      'token': token,
      'email_verified_at': email_verified_at,
      'fcm': fcm,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      user_name: map['user_name'] != null ? map['user_name'] as String : null,
      id: map['id'] != null ? map['id'].toString() as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      market_name:
          map['market_name'] != null ? map['market_name'] as String : null,
      number_phone: map['number_phone'] != null
          ? map['number_phone'].toString() as String
          : null,
      role_id:
          map['role_id'] != null ? map['role_id'].toString() as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      email_verified_at: map['email_verified_at'] != null
          ? map['email_verified_at'] as String
          : null,
      fcm: map['fcm'] != null ? map['fcm'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfo(user_name: $user_name, id: $id, email: $email, market_name: $market_name, number_phone: $number_phone, role_id: $role_id, token: $token, email_verified_at: $email_verified_at, fcm: $fcm)';
  }

  @override
  bool operator ==(covariant UserInfo other) {
    if (identical(this, other)) return true;

    return other.user_name == user_name &&
        other.id == id &&
        other.email == email &&
        other.market_name == market_name &&
        other.number_phone == number_phone &&
        other.role_id == role_id &&
        other.token == token &&
        other.email_verified_at == email_verified_at &&
        other.fcm == fcm;
  }

  @override
  int get hashCode {
    return user_name.hashCode ^
        id.hashCode ^
        email.hashCode ^
        market_name.hashCode ^
        number_phone.hashCode ^
        role_id.hashCode ^
        token.hashCode ^
        email_verified_at.hashCode ^
        fcm.hashCode;
  }
}
