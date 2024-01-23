class CurrentModel {
  final num temp_c;
  final num humidity;
  final num wind_kph;
  final num cloud;
  final String condition;

  CurrentModel(
      {required this.temp_c,
      required this.condition,
      required this.wind_kph,
      required this.humidity,
      required this.cloud});

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
      temp_c: json['temp_c'] as num? ?? 0,
      condition: json['condition']['text'] as String? ?? "",
      wind_kph: json['wind_kph'] as num? ?? 0,
      humidity: json['humidity'] as num? ?? 0,
      cloud: json['cloud'] as num? ?? 0,
    );
  }
}
