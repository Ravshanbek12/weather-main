part of 'weather_bloc.dart';


sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}


class WeatherSuccess extends WeatherState {

  final WeatherEntity weatherEntity;

  WeatherSuccess({required this.weatherEntity});


}
class WeatherFailure extends WeatherState {
  final String errorMessage;
  final num? errorCode;

  WeatherFailure({required this.errorMessage, required this.errorCode});
}