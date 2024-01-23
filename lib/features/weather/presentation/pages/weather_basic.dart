import 'package:flutter/material.dart';

class WeatherBasicScreen extends StatefulWidget {
  const WeatherBasicScreen({super.key});

  @override
  State<WeatherBasicScreen> createState() => _WeatherBasicScreenState();
}

class _WeatherBasicScreenState extends State<WeatherBasicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
          alignment: AlignmentDirectional.topCenter,
            children: [
      Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/backgorund.png"),
              fit: BoxFit.cover),
        ),
      ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.093,vertical: MediaQuery.of(context).size.height*0.10,),
            width: 321,
            height: MediaQuery.of(context).size.height*0.38,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(35)),
            ),
            child: Column(

            ),
          ),

    ]));
  }
}
