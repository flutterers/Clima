import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/weather_helper.dart';
import '../utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

void getLocationWeatherData(context) async {
  dynamic weatherData = await WeatherHelper().getLocationWeatherData();
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          weatherData: weatherData,
        ),
      ));
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationWeatherData(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SpinKitDualRing(
        color: Colors.white70,
        size: 50.0,
      ),
    );
  }
}
