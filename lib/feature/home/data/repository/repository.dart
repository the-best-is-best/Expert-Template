import 'package:chat_ui/app/network/failure.dart';
import 'package:chat_ui/app/network/network_info.dart';
import 'package:chat_ui/feature/home/data/data_source/remote_data_source.dart';
import 'package:chat_ui/feature/home/data/mapper/home_data_to_model.dart';
import 'package:chat_ui/feature/home/domain/models/home_model.dart';
import 'package:chat_ui/feature/home/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../app/network/error_handler.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getHomeData();

        if (response.status.code == ApiInternalStatus.SUCCESS) {
          // success
          // return either right
          // return data
          return Right(response.toDomain());
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.status.title ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
