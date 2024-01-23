class LocationModel {
  final String name;
  final String country;
  final String localtime;

  LocationModel(
      {required this.name, required this.country, required this.localtime});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        name: json['name']as String? ??"",
        country: json['country']as String? ??"",
        localtime: json['localtime']as String? ??"");
  }
}
