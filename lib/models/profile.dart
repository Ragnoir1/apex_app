import 'dart:convert';

class Profile {
  final String name;
  final String tag;
  final int level;
  final int toNextLevelPercent;

  Profile({
    required this.name,
    required this.tag,
    required this.level,
    required this.toNextLevelPercent,
  });

  Profile copyWith({
    String? name,
    String? tag,
    int? level,
    int? toNextLevelPercent,
  }) {
    return Profile(
      name: name ?? this.name,
      tag: tag ?? this.tag,
      level: level ?? this.level,
      toNextLevelPercent: toNextLevelPercent ?? this.toNextLevelPercent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'tag': tag,
      'level': level,
      'toNextLevelPercent': toNextLevelPercent,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'] as String,
      tag: map['tag'] as String,
      level: map['level'] as int,
      toNextLevelPercent: map['toNextLevelPercent'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(name: $name, tag: $tag, level: $level, toNextLevelPercent: $toNextLevelPercent)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.tag == tag &&
        other.level == level &&
        other.toNextLevelPercent == toNextLevelPercent;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        tag.hashCode ^
        level.hashCode ^
        toNextLevelPercent.hashCode;
  }

  static Profile empty() {
    return Profile(name: '', tag: '', level: 0, toNextLevelPercent: 0);
  }
}
