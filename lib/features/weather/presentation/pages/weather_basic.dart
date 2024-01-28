import 'package:flutter/material.dart';
import 'package:weather/core/injector/injector.dart';
import 'package:weather/features/weather/data/repository/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/weather_bloc.dart';
import 'package:intl/intl.dart';

class WeatherBasicScreen extends StatefulWidget {
  const WeatherBasicScreen({super.key});

  @override
  State<WeatherBasicScreen> createState() => _WeatherBasicScreenState();
}

class _WeatherBasicScreenState extends State<WeatherBasicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => WeatherBloc(
            weatherRepositoryImpl: serviceLocator<WeatherRepositoryImpl>()),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (contextPro, state) {
            switch (state.runtimeType) {
              case WeatherInitial:
                contextPro.read<WeatherBloc>().add(WeatherStarted());
                print("State Initial");
                return const SizedBox(
                  child: Center(
                    child: Text("WeatherInitial"),
                  ),
                );
              case WeatherFailure:
                return Center(
                  child: Text(
                    (state as WeatherFailure).errorMessage,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              case WeatherSuccess:
                final data = state as WeatherSuccess;
                final colorItem = getItemColor(
                  data.weatherEntity.currentModel.temp_c.toInt(),
                  data.weatherEntity.currentModel.humidity.toInt(),
                );
                print("state is WeatherSuccess");
                return Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        constraints: const BoxConstraints.expand(),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/image/backgorund.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.093,
                          vertical: MediaQuery.of(context).size.height * 0.10,
                        ),
                        width: 321,
                        height: MediaQuery.of(context).size.height * 0.38,
                        decoration: BoxDecoration(
                          color: getBackColor(
                            data.weatherEntity.currentModel.temp_c.toInt(),
                            data.weatherEntity.currentModel.humidity.toInt(),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15.5,
                            ),
                            Text(
                              "${DateFormat.yMMMd().format(
                                    DateTime.parse(data
                                        .weatherEntity.locationModel.localtime),
                                  ).replaceAll(",", "").split(" ")[1]} ${DateFormat.yMMMd().format(
                                DateTime.parse(data
                                    .weatherEntity.locationModel.localtime),
                              ).replaceAll(",", "").split(" ")[0]} ${DateFormat.yMMMd().format(
                                DateTime.parse(data
                                    .weatherEntity.locationModel.localtime),
                              ).replaceAll(",", "").split(" ")[2]}",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: colorItem),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SvgPicture.asset(
                                  getIcon(
                                    data.weatherEntity.currentModel.temp_c
                                        .toInt(),
                                    data.weatherEntity.currentModel.humidity
                                        .toInt(),
                                  ),
                                  width: 70,
                                  height: 47,
                                ),
                                Text(
                                  "${data.weatherEntity.currentModel.temp_c.toInt()}",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: colorItem),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Center(
                              child: Text(
                                data.weatherEntity.currentModel.condition,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  color: colorItem,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Center(
                              child: Text(
                                "${data.weatherEntity.locationModel.name},${data.weatherEntity.locationModel.country}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: colorItem),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Wind speed:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                        color: colorItem),
                                  ),
                                  Text(
                                    "${data.weatherEntity.currentModel.wind_kph}km/h",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins",
                                        color: colorItem),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Humidity:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                        color: colorItem),
                                  ),
                                  Text(
                                    "${data.weatherEntity.currentModel.humidity}%",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins",
                                        color: colorItem),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Cloud:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                        color: colorItem),
                                  ),
                                  Text(
                                    "${data.weatherEntity.currentModel.cloud}%",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins",
                                        color: colorItem),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]);
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }
}

Color getBackColor(int temp, int humidity) {
  if (temp >= 25) {
    return const Color(0xFFFAE2BD);
  } else if (humidity == 50) {
    return const Color(0xFFAC736A);
  } else if (humidity == 100) {
    return const Color(0xFF40666A);
  }
  return const Color(0xFF99B8CC);
}

String getIcon(int temp, int humidity) {
  if (temp >= 25) {
    return "assets/svg/sunny.svg";
  } else if (humidity == 50) {
    return 'assets/svg/cloudy.svg';
  } else if (humidity == 100) {
    return "assets/svg/rainy.svg";
  }
  return "assets/svg/snowy.svg";
}

Color getItemColor(int temp, int humidity) {
  if (temp >= 25) {
    return const Color(0xFFEFAA82);
  } else if (humidity == 50) {
    return const Color(0xFFF6C8A4);
  } else if (humidity == 100) {
    return const Color(0xFFC9E8E0);
  }
  return const Color(0xFFE4F1F9);
}
