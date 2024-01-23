import 'package:weather/features/weather/data/models/location.dart';

import 'current.dart';

class WeatherModel {
  final CurrentModel currentModel;
  final LocationModel locationModel;

  WeatherModel({required this.currentModel, required this.locationModel});

  factory WeatherModel.formJson(Map<String, dynamic> json) {
    return WeatherModel(
        currentModel: json['current'], locationModel: json['location']);
  }
}
