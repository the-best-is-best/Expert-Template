import 'dart:convert';

class CategoriesResponse {
  final int? id;
  final String? icon;
  final String? title;
  final int? expert;

  CategoriesResponse(this.id, this.icon, this.title, this.expert);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (icon != null) {
      result.addAll({'icon': icon});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (expert != null) {
      result.addAll({'expert': expert});
    }

    return result;
  }

  factory CategoriesResponse.fromMap(Map<String, dynamic> map) {
    return CategoriesResponse(
      map['id']?.toInt(),
      map['icon'],
      map['title'],
      map['expert']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesResponse.fromJson(String source) =>
      CategoriesResponse.fromMap(json.decode(source));
}
