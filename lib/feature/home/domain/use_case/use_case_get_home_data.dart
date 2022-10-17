import 'package:chat_ui/app/network/failure.dart';
import 'package:chat_ui/feature/home/domain/models/home_model.dart';
import 'package:chat_ui/feature/home/domain/repository/repository.dart';
import 'package:chat_ui/feature/home/domain/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<void, HomeModel> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, HomeModel>> execute(void input) async {
    return await _repository.getHomeData();
  }
}
