import 'dart:convert';

class StatusResponse {
  final int code;
  final String? title;

  StatusResponse({required this.code, required this.title});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});
    result.addAll({'title': title});

    return result;
  }

  factory StatusResponse.fromMap(Map<String, dynamic> map) {
    return StatusResponse(
      code: map['code'] ?? '',
      title: map['title'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusResponse.fromJson(String source) =>
      StatusResponse.fromMap(json.decode(source));
}
