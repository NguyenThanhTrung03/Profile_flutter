import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'address_info.dart';

class UserInfo {
  String? name;
  String? email;
  String? phoneNumber;
  DateTime? birthDate;
  AddressInfo? address;

  UserInfo({
    this.name,
    this.email,
    this.phoneNumber,
    this.birthDate,
    this.address,
  });

  UserInfo copyWith({
    ValueGetter<String?>? name,
    ValueGetter<String?>? email,
    ValueGetter<String?>? phoneNumber,
    ValueGetter<DateTime?>? birthDate,
  }) {
    return UserInfo(
      name: name != null ? name() : this.name,
      email: email != null ? email() : this.email,
      phoneNumber: phoneNumber != null ? phoneNumber() : this.phoneNumber,
      birthDate: birthDate != null ? birthDate() : this.birthDate,
      address: address != null ? address!.copyWith() : this.address,
    );
  }

  UserInfo toMap() {
    return UserInfo(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      birthDate: birthDate,
      address: address,
    );
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      birthDate:
          map['birthDate'] != null ? DateTime.parse(map['birthDate']) : null,
      address:
          map['address'] != null ? AddressInfo.fromMap(map['address']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  UserInfo fromJson(String source) => UserInfo.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserInfo(name: $name, email: $email, phoneNumber: $phoneNumber, birthDate: $birthDate, address: $address)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInfo &&
        other.name == name &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.birthDate == birthDate &&
        other.address == address;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      birthDate.hashCode ^
      address.hashCode;
}
