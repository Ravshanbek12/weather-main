import 'package:weather/core/either/either.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';
import 'package:weather/features/weather/domain/repositories/weather_repository.dart';


class GetWeatherUseCase {
  final WeatherRepository _weatherRepository;

   GetWeatherUseCase(this._weatherRepository);


  Future<Either<ServerFailure, WeatherEntity>> call(params) {
    return _weatherRepository.getCurrentWeather();
  }
}
