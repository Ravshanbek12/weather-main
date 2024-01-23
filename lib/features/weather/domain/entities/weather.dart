import 'package:equatable/equatable.dart';
import 'package:weather/features/weather/data/models/current.dart';
import 'package:weather/features/weather/data/models/location.dart';

class WeatherEntity extends Equatable {
  final LocationModel locationModel;
  final CurrentModel currentModel;

  const WeatherEntity(
      {required this.currentModel, required this.locationModel});

  @override
  // TODO: implement props
  List<Object?> get props => [locationModel, currentModel];
}
