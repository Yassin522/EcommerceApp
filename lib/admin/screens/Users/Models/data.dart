// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Data {
  String? id;
  String? nameUser;
  String? nameMarket;
  String? numberPhone;
  String? email;
  String? fCM;
  String? roleId;
  Data({
    this.id,
    this.nameUser,
    this.nameMarket,
    this.numberPhone,
    this.email,
    this.fCM,
    this.roleId,
  });

  Data copyWith({
    String? id,
    String? nameUser,
    String? nameMarket,
    String? numberPhone,
    String? email,
    String? fCM,
    String? roleId,
  }) {
    return Data(
      id: id ?? this.id,
      nameUser: nameUser ?? this.nameUser,
      nameMarket: nameMarket ?? this.nameMarket,
      numberPhone: numberPhone ?? this.numberPhone,
      email: email ?? this.email,
      fCM: fCM ?? this.fCM,
      roleId: roleId ?? this.roleId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameUser': nameUser,
      'nameMarket': nameMarket,
      'numberPhone': numberPhone,
      'email': email,
      'fCM': fCM,
      'roleId': roleId,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'] != null ? map['id'] as String : null,
      nameUser: map['nameUser'] != null ? map['nameUser'] as String : null,
      nameMarket:
          map['nameMarket'] != null ? map['nameMarket'] as String : null,
      numberPhone:
          map['numberPhone'] != null ? map['numberPhone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      fCM: map['fCM'] != null ? map['fCM'] as String : null,
      roleId: map['roleId'] != null ? map['roleId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(id: $id, nameUser: $nameUser, nameMarket: $nameMarket, numberPhone: $numberPhone, email: $email, fCM: $fCM, roleId: $roleId)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nameUser == nameUser &&
        other.nameMarket == nameMarket &&
        other.numberPhone == numberPhone &&
        other.email == email &&
        other.fCM == fCM &&
        other.roleId == roleId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nameUser.hashCode ^
        nameMarket.hashCode ^
        numberPhone.hashCode ^
        email.hashCode ^
        fCM.hashCode ^
        roleId.hashCode;
  }
}
