import 'package:weather/core/either/either.dart';

import 'package:weather/core/extansion/model.dart';

import 'package:weather/core/failure/failure.dart';

import 'package:weather/features/weather/domain/entities/weather.dart';

import '../../../../core/exception/exception.dart';

import '../../domain/repositories/weather_repository.dart';

import '../data_source/remote.dart';

class WeatherRepositoryImpl implements WeatherRepository{
 final WeatherRemoteDataSource _weatherRemoteDataSource;
 const WeatherRepositoryImpl(WeatherRemoteDataSource weatherRemoteDataSource):_weatherRemoteDataSource=weatherRemoteDataSource;

  @override
  Future<Either<ServerFailure, WeatherEntity>> getCurrentWeather() async{
    try{
      final weatherModel =await _weatherRemoteDataSource.getWeather();
      return Right(weatherModel.toEntity);
    }on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

}