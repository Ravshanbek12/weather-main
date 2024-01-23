
import 'package:weather/core/either/either.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';

import '../../../../core/failure/failure.dart';

abstract class WeatherRepository{
  Future<Either<ServerFailure,WeatherEntity>> getCurrentWeather();
}