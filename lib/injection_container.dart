import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_me/features/navigation_bar/presentation/cubit/nav_bar/bottom_navigation_cubit.dart';

import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';
import 'features/splash/data/datasources/lang_local_data_source.dart';
import 'features/splash/data/repositories/lang_repository_impl.dart';
import 'features/splash/domain/repositories/lang_repository.dart';
import 'features/splash/domain/usecases/change_lang.dart';
import 'features/splash/domain/usecases/get_saved_lang.dart';
import 'features/splash/presentation/cubit/locale_cubit.dart';

GetIt sl = GetIt.instance;
Future<void> init() async {
  // Blocs
  sl.registerFactory<LocaleCubit>(
      () => LocaleCubit(changeLangUseCase: sl(), getSavedLangUseCase: sl()));
  sl.registerFactory<BottomNavigationCubit>(() => BottomNavigationCubit());

  // Use cases
  sl.registerLazySingleton<GetSavedLang>(
      () => GetSavedLang(langRepository: sl()));
  sl.registerLazySingleton<ChangeLang>(() => ChangeLang(langRepository: sl()));

  // Repository
  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(langLocalDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<LangLocalDataSource>(
    () => LangLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Features


  //core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton(() => LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true));
  sl.registerLazySingleton(() => AppIntercepters(langLocalDataSource: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
