import 'package:chat_ui/app/extensions.dart';
import 'package:chat_ui/feature/home/data/response/category_response.dart';
import 'package:chat_ui/feature/home/data/response/home_response.dart';
import 'package:chat_ui/feature/home/data/response/online_experts_response.dart';
import 'package:chat_ui/feature/home/data/response/recommend_experts_response.dart';
import 'package:chat_ui/feature/home/domain/models/category_model.dart';
import 'package:chat_ui/feature/home/domain/models/experts_model.dart';
import 'package:chat_ui/feature/home/domain/models/home_model.dart';
import 'package:chat_ui/feature/home/domain/models/online_expert_model.dart';

extension HomeDataToModel on HomeResponse? {
  HomeModel toDomain() {
    return HomeModel(
        categoryModel: (this?.data?.categories?.map((e) => e.toDomain()) ??
                const Iterable.empty())
            .cast<CategoryModel>()
            .toList(),
        recommendedExpertsModel:
            (this?.data?.recommendedExpert?.map((e) => e.toDomain()) ??
                    const Iterable.empty())
                .cast<ExpertsModel>()
                .toList(),
        onlineExpertModel:
            (this?.data?.onlineExpert?.map((e) => e.toDomain()) ??
                    const Iterable.empty())
                .cast<OnlineExpertModel>()
                .toList());
  }
}

extension RecommendExpertsToModel on RecommendExpertsResponse? {
  ExpertsModel toDomain() {
    return ExpertsModel(
      id: this?.id?.orEmpty() ?? 0,
      name: this?.name?.orEmpty() ?? "",
      desc: this?.desc?.orEmpty() ?? "",
      image: this?.image?.orEmpty() ?? "",
      rate: this?.rate?.orEmpty() ?? 0,
    );
  }
}

extension OnlineExpertsToModel on OnlineExpertsResponse? {
  OnlineExpertModel toDomain() {
    return OnlineExpertModel(
        id: this?.id?.orEmpty() ?? 0,
        image: this?.image?.orEmpty() ?? "",
        name: this?.name?.orEmpty() ?? "",
        status: this?.status ?? false);
  }
}

extension CategoriesResponseToModel on CategoriesResponse? {
  CategoryModel toDomain() {
    return CategoryModel(
        id: this?.id?.orEmpty() ?? 0,
        icon: this?.icon?.orEmpty() ?? "",
        expert: this?.expert?.orEmpty() ?? 0,
        title: this?.title?.orEmpty() ?? "");
  }
}
