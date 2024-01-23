

import 'package:bloc/bloc.dart';

import '../../data/repository/weather.dart';
import '../../domain/entities/weather.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepositoryImpl _weatherRepositoryImpl;
  WeatherBloc({required WeatherRepositoryImpl weatherRepositoryImpl}):_weatherRepositoryImpl=weatherRepositoryImpl,
       super(WeatherInitial()) {
    on<WeatherStarted>((event, emit) async{
      emit(WeatherLoading());
      try {
        final data = await _weatherRepositoryImpl.getCurrentWeather();
        emit(WeatherSuccess(weatherEntity: data.right));
      }catch (e) {
        emit(WeatherFailure(errorMessage: "$e", errorCode: null));
      }
    });
  }
}
