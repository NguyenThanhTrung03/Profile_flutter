import 'dart:convert';

import 'package:flutter/widgets.dart';

class District {
  String? id;
  String? name;
  String? level;
  String? provinceId;
  District({
    this.id,
    this.name,
    this.level,
    this.provinceId,
  });

  District copyWith({
    ValueGetter<String?>? id,
    ValueGetter<String?>? name,
    ValueGetter<String?>? level,
    ValueGetter<String?>? provinceId,
  }) {
    return District(
      id: id != null ? id() : this.id,
      name: name != null ? name() : this.name,
      level: level != null ? level() : this.level,
      provinceId: provinceId != null ? provinceId() : this.provinceId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'level': level,
      'provinceId': provinceId,
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      id: map['id'],
      name: map['name'],
      level: map['level'],
      provinceId: map['provinceId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) =>
      District.fromMap(json.decode(source));

  @override
  String toString() {
    return 'District(id: $id, name: $name, level: $level, provinceId: $provinceId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is District &&
        other.id == id &&
        other.name == name &&
        other.level == level &&
        other.provinceId == provinceId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ level.hashCode ^ provinceId.hashCode;
  }
}
