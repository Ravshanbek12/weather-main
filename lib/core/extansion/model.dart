import 'package:weather/features/weather/data/models/weather.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';

extension WeatherExtension on WeatherModel {
  WeatherEntity get toEntity {
    return WeatherEntity(
      locationModel: locationModel,
      currentModel: currentModel,
    );
  }
}
