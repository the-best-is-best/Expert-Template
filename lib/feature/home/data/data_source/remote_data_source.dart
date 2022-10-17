import 'package:chat_ui/app/network/app_api.dart';
import 'package:chat_ui/feature/home/data/response/home_response.dart';

abstract class RemoteDataSource {
  Future<HomeResponse> getHomeData();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServicesClient _appServicesClient;

  RemoteDataSourceImpl(this._appServicesClient);

  @override
  Future<HomeResponse> getHomeData() async {
    return await _appServicesClient.getHomeData();
  }
}
