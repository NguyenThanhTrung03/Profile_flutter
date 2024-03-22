import 'dart:convert';

import 'package:flutter/widgets.dart';

class AddressInfo {
  String? province;
  String? district;
  String? ward;
  String? street;

  AddressInfo({this.province, this.district, this.ward, this.street});

  AddressInfo copyWith({
    ValueGetter<String?>? province,
    ValueGetter<String?>? district,
    ValueGetter<String?>? ward,
    ValueGetter<String?>? street,
  }) {
    return AddressInfo(
      province: province != null ? province() : this.province,
      district: district != null ? district() : this.district,
      ward: ward != null ? ward() : this.ward,
      street: street != null ? street() : this.street,
    );
  }

  AddressInfo toMap() {
    return AddressInfo(
      province: province,
      district: district,
      ward: ward,
      street: street,
    );
  }

  factory AddressInfo.fromMap(Map<String, dynamic> map) {
    return AddressInfo(
      province: map['province'],
      district: map['AddressInfo'],
      ward: map['ward'],
      street: map['street'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressInfo.fromJson(String source) =>
      AddressInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressInfo(province: $province, AddressInfo: $AddressInfo, ward: $ward, street: $street)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressInfo &&
        other.province == province &&
        other.district == district &&
        other.ward == ward &&
        other.street == street;
  }

  @override
  int get hashCode {
    return province.hashCode ^
        district.hashCode ^
        ward.hashCode ^
        street.hashCode;
  }
}
