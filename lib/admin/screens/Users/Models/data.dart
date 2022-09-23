// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserData {
  String? id;
  String? name_user;
  String? name_market;
  String? number_phone;
  String? email;
  String? FCM;
  String? role_id;
  UserData({
    this.id,
    this.name_user,
    this.name_market,
    this.number_phone,
    this.email,
    this.FCM,
    this.role_id,
  });

  UserData copyWith({
    String? id,
    String? name_user,
    String? name_market,
    String? number_phone,
    String? email,
    String? FCM,
    String? role_id,
  }) {
    return UserData(
      id: id ?? this.id,
      name_user: name_user ?? this.name_user,
      name_market: name_market ?? this.name_market,
      number_phone: number_phone ?? this.number_phone,
      email: email ?? this.email,
      FCM: FCM ?? this.FCM,
      role_id: role_id ?? this.role_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name_user': name_user,
      'name_market': name_market,
      'number_phone': number_phone,
      'email': email,
      'FCM': FCM,
      'role_id': role_id,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'] != null ? map['id'].toString() as String : null,
      name_user: map['name_user'] != null ? map['name_user'] as String : null,
      name_market:
          map['name_market'] != null ? map['name_market'] as String : null,
      number_phone: map['number_phone'] != null
          ? map['number_phone'].toString() as String
          : null,
      email: map['email'] != null ? map['email'] as String : null,
      FCM: map['FCM'] != null ? map['FCM'] as String : null,
      role_id:
          map['role_id'] != null ? map['role_id'].toString() as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(id: $id, name_user: $name_user, name_market: $name_market, number_phone: $number_phone, email: $email, FCM: $FCM, role_id: $role_id)';
  }

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name_user == name_user &&
        other.name_market == name_market &&
        other.number_phone == number_phone &&
        other.email == email &&
        other.FCM == FCM &&
        other.role_id == role_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name_user.hashCode ^
        name_market.hashCode ^
        number_phone.hashCode ^
        email.hashCode ^
        FCM.hashCode ^
        role_id.hashCode;
  }
}
