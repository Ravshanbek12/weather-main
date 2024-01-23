import '../models/weather.dart';
import 'package:dio/dio.dart';

abstract class WeatherRemoteDataSource{
  Future<WeatherModel> getWeather();
  factory WeatherRemoteDataSource()=> _WeatherRemoteDataSourceImpl();
}

class _WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource{


  @override
  Future<WeatherModel> getWeather() async{
    final response =await Dio().get("http://api.weatherapi.com/v1/current.json?key=e76d154ceb2a4e05a2c62513241901&q=Tashkent&aqi=no");
    try{
      if(response.statusCode!>=200&&response.statusCode!<300){
        return WeatherModel.formJson(response.data);
      }
      else{
        throw "Response Failed";
      }
    }
    catch (error) {
      throw 'Something went wrong!';
    }
    }
  }
