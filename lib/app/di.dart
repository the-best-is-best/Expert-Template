import 'package:chat_ui/app/network/app_api.dart';
import 'package:chat_ui/app/network/dio_factory.dart';
import 'package:chat_ui/app/network/network_info.dart';
import 'package:chat_ui/feature/home/data/data_source/remote_data_source.dart';
import 'package:chat_ui/feature/home/data/repository/repository.dart';
import 'package:chat_ui/feature/home/domain/repository/repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final di = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // network info
  di.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  di.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = await di<DioFactory>().call();
  //app service client
  di.registerLazySingleton<AppServicesClient>(() => AppServicesClient(dio));

  // remote data source
  di.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(di<AppServicesClient>()));

  // repository

  di.registerLazySingleton<Repository>(() => RepositoryImpl(di(), di()));
}
