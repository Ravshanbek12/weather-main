import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/features/weather/data/data_source/remote.dart';
import 'package:weather/features/weather/data/repository/weather.dart';
import 'package:weather/features/weather/domain/usecase/get_current_weather.dart';

import '../../features/weather/domain/repositories/weather_repository.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerSingletonAsync(
      () async => await SharedPreferences.getInstance());

  serviceLocator.registerLazySingleton(() => WeatherRemoteDataSource());

  serviceLocator
      .registerLazySingleton(() => WeatherRepositoryImpl(serviceLocator()));

  serviceLocator
      .registerLazySingleton(() => GetWeatherUseCase(serviceLocator()));



}
