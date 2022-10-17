import 'dart:convert';

import 'package:chat_ui/app/network/base/status_response.dart';
import 'package:chat_ui/feature/home/data/response/category_response.dart';
import 'package:chat_ui/feature/home/data/response/online_experts_response.dart';
import 'package:chat_ui/feature/home/data/response/recommend_experts_response.dart';

class HomeResponse {
  final StatusResponse status;
  final DataResponse? data;

  HomeResponse(this.status, this.data);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (status != null) {
      result.addAll({'status': status.toMap()});
    }
    if (data != null) {
      result.addAll({'data': data!.toMap()});
    }

    return result;
  }

  factory HomeResponse.fromJson(Map<String, dynamic> map) {
    return HomeResponse(
      map['status'] = StatusResponse.fromMap(map['status']),
      map['data'] != null ? DataResponse.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeResponse.fromMap(String source) =>
      HomeResponse.fromJson(json.decode(source));
}

class DataResponse {
  final List<RecommendExpertsResponse>? recommendedExpert;
  final List<OnlineExpertsResponse>? onlineExpert;
  final List<CategoriesResponse>? categories;
  DataResponse({
    required this.recommendedExpert,
    required this.onlineExpert,
    required this.categories,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (recommendedExpert != null) {
      result.addAll({
        'recommended_expert': recommendedExpert!.map((x) => x.toMap()).toList()
      });
    }
    if (onlineExpert != null) {
      result.addAll(
          {'online_expert': onlineExpert!.map((x) => x.toMap()).toList()});
    }
    if (categories != null) {
      result.addAll({'categories': categories!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory DataResponse.fromMap(Map<String, dynamic> map) {
    return DataResponse(
      recommendedExpert: map['recommended_expert'] != null
          ? List<RecommendExpertsResponse>.from(map['recommended_expert']
              ?.map((x) => RecommendExpertsResponse.fromMap(x)))
          : null,
      onlineExpert: map['online_expert'] != null
          ? List<OnlineExpertsResponse>.from(map['online_expert']
              ?.map((x) => OnlineExpertsResponse.fromMap(x)))
          : null,
      categories: map['categories'] != null
          ? List<CategoriesResponse>.from(
              map['categories']?.map((x) => CategoriesResponse.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataResponse.fromJson(String source) =>
      DataResponse.fromMap(json.decode(source));
}
