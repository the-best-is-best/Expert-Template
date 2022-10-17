import 'package:chat_ui/feature/home/domain/models/category_model.dart';
import 'package:chat_ui/feature/home/domain/models/experts_model.dart';
import 'package:chat_ui/feature/home/domain/models/online_expert_model.dart';

class HomeModel {
  final List<CategoryModel> categoryModel;
  final List<ExpertsModel> recommendedExpertsModel;
  final List<OnlineExpertModel> onlineExpertModel;
  HomeModel({
    required this.categoryModel,
    required this.recommendedExpertsModel,
    required this.onlineExpertModel,
  });
}
