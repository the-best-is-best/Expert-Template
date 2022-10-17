import 'dart:convert';

class OnlineExpertsResponse {
  final int? id;
  final String? name;
  final String? image;
  final bool? status;

  OnlineExpertsResponse(this.id, this.name, this.image, this.status);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (image != null) {
      result.addAll({'image': image});
    }
    if (status != null) {
      result.addAll({'status': status});
    }

    return result;
  }

  factory OnlineExpertsResponse.fromMap(Map<String, dynamic> map) {
    return OnlineExpertsResponse(
      map['id']?.toInt(),
      map['name'],
      map['image'],
      map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OnlineExpertsResponse.fromJson(String source) =>
      OnlineExpertsResponse.fromMap(json.decode(source));
}
