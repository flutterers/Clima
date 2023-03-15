import 'package:clima/services/weather_data.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.date,
    required this.weatherData,
  });

  final String date;
  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    final String temp = weatherData.getTemperature().toString();

    return Column(
      children: [
        Text(
          date,
          style: kTextStyle.copyWith(fontSize: 20),
        ),
        Expanded(
          child: Image.asset(
            weatherData.getConditionAssetImage(),
            height: 10,
            width: 50,
          ),
        ),
        Text(
          "$temp°",
          style: kTextStyle.copyWith(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
