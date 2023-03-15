import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class WeatherData {
  final dynamic weatherDataDecoded;
  late final int _condition;
  late final String _cityName;
  late final int _temp;
  late final String _description;
  late final Color _bgColor;
  late final String _conditionParsedIcon;

  WeatherData({required this.weatherDataDecoded}) {
    _condition = weatherDataDecoded['weather'][0]['id'];
    _cityName = weatherDataDecoded['name'];
    _temp = weatherDataDecoded['main']['temp'].toInt();
    _description = weatherDataDecoded['weather'][0]['description'];
    _conditionParsedIcon = weatherDataDecoded['weather'][0]['icon'];

    var test = [_temp, _condition, _cityName, _description];
    print(test);
  }

  String getCityName() => _cityName;
  int getTemperature() => _temp;
  int getCondition() => _condition;
  String getConditionDescription() => _description;
  Color getBackgroundColor() => _bgColor;

  String getConidtionNetworkImage() {
    String imageUrl = "$kAPIimagesUrlBase$_conditionParsedIcon@4x.png";
    // Image img = Image.network(imageUrl);
    return imageUrl;
  }

  String getConditionAssetImage() {
    String fileName;
    if (_condition < 300) {
      fileName = "rainy";
    } else if (_condition < 400) {
      fileName = "thunder";
    } else if (_condition < 600) {
      fileName = 'rain_1';
    } else if (_condition < 700) {
      fileName = 'snow_2';
    } else if (_condition < 800) {
      fileName = 'wind';
    } else if (_condition == 800) {
      fileName = 'sunny';
    } else if (_condition <= 804) {
      fileName = 'cloudy';
    } else {
      fileName = 'rainbow';
    }
    return "images/$fileName.png";
  }

  String getConditionIcon() {
    if (_condition < 300) {
      return '🌩';
    } else if (_condition < 400) {
      return '🌧';
    } else if (_condition < 600) {
      return '☔️';
    } else if (_condition < 700) {
      return '☃️';
    } else if (_condition < 800) {
      return '🌫';
    } else if (_condition == 800) {
      return '☀️';
    } else if (_condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getTemperatureMessage() {
    if (_temp > 25) {
      return 'It\'s 🍦 time';
    } else if (_temp > 20) {
      return 'Time for shorts and 👕';
    } else if (_temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
