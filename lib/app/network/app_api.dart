import 'package:chat_ui/app/constants.dart';
import 'package:chat_ui/feature/home/data/response/home_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServicesClient {
  factory AppServicesClient(Dio dio, {String baseUrl}) =
      _AppServicesClient; // factory

  @GET(Constants.homeUrl)
  Future<HomeResponse> getHomeData();
}
