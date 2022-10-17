import 'dart:convert';

class RecommendExpertsResponse {
  final int? id;
  final String? name;
  final String? desc;
  final double? rate;
  final String? image;
  RecommendExpertsResponse({
    this.id,
    this.name,
    this.desc,
    this.rate,
    this.image,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (desc != null) {
      result.addAll({'desc': desc});
    }
    if (rate != null) {
      result.addAll({'rate': rate});
    }
    if (image != null) {
      result.addAll({'image': image});
    }

    return result;
  }

  factory RecommendExpertsResponse.fromMap(Map<String, dynamic> map) {
    return RecommendExpertsResponse(
      id: map['id']?.toInt(),
      name: map['name'],
      desc: map['desc'],
      rate: map['rate']?.toDouble(),
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RecommendExpertsResponse.fromJson(String source) =>
      RecommendExpertsResponse.fromMap(json.decode(source));
}
