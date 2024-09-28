// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Legend {
  final String name;
  final int kills;
  final String icon;

  Legend({
    required this.name,
    required this.kills,
    required this.icon,
  });

  Legend copyWith({
    String? name,
    int? kills,
    String? icon,
  }) {
    return Legend(
      name: name ?? this.name,
      kills: kills ?? this.kills,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'kills': kills,
      'icon': icon,
    };
  }

  factory Legend.fromMap(Map<String, dynamic> map) {
    return Legend(
      name: map['LegendName'] as String,
      kills: (map['data'] != null && map['data'].isNotEmpty)
          ? map['data'][0]['value'] as int
          : 0,
      icon: map['ImgAssets']['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Legend.fromJson(String source) =>
      Legend.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Legend(name: $name, kills: $kills, icon: $icon)';

  @override
  bool operator ==(covariant Legend other) {
    if (identical(this, other)) return true;

    return other.name == name && other.kills == kills && other.icon == icon;
  }

  @override
  int get hashCode => name.hashCode ^ kills.hashCode ^ icon.hashCode;

  static Legend empty() {
    return Legend(name: "", kills: 0, icon: "");
  }
}
