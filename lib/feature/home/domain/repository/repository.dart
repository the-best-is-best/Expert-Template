import 'package:chat_ui/app/network/failure.dart';
import 'package:chat_ui/feature/home/domain/models/home_model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, HomeModel>> getHomeData();
}
