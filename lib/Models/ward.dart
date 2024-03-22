import 'dart:convert';

import 'package:flutter/widgets.dart';




class Ward {
  String? id;
  String? name;
  String? level;
  String? districtId;
  Ward({
    this.id,
    this.name,
    this.level,
    this.districtId,
  });

  Ward copyWith({
    ValueGetter<String?>? id,
    ValueGetter<String?>? name,
    ValueGetter<String?>? level,
    ValueGetter<String?>? districtId,
  }) {
    return Ward(
      id: id != null ? id() : this.id,
      name: name != null ? name() : this.name,
      level: level != null ? level() : this.level,
      districtId: districtId != null ? districtId() : this.districtId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'level': level,
      'districtId': districtId,
    };
  }

  factory Ward.fromMap(Map<String, dynamic> map) {
    return Ward(
      id: map['id'],
      name: map['name'],
      level: map['level'],
      districtId: map['districtId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ward.fromJson(String source) => Ward.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ward(id: $id, name: $name, level: $level, districtId: $districtId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Ward &&
      other.id == id &&
      other.name == name &&
      other.level == level &&
      other.districtId == districtId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      level.hashCode ^
      districtId.hashCode;
  }
}

