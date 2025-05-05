import 'package:booly_new/core/utliti/api_services.dart';
import 'package:booly_new/feature/home/data/repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setup()  {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
}
