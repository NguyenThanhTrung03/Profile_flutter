import 'dart:convert';

import 'package:flutter/widgets.dart';

class Province {
  String? id;
  String? name;
  String? level;
  Province({
    this.id,
    this.name,
    this.level,
  });

  Province copyWith({
    ValueGetter<String?>? id,
    ValueGetter<String?>? name,
    ValueGetter<String?>? level,
  }) {
    return Province(
      id: id != null ? id() : this.id,
      name: name != null ? name() : this.name,
      level: level != null ? level() : this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'level': level,
    };
  }

  factory Province.fromMap(Map<String, dynamic> map) {
    return Province(
      id: map['id'],
      name: map['name'],
      level: map['level'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Province.fromJson(String source) =>
      Province.fromMap(json.decode(source));

  @override
  String toString() => 'Province(id: $id, name: $name, level: $level)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Province &&
        other.id == id &&
        other.name == name &&
        other.level == level;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ level.hashCode;
}
