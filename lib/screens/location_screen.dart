import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';

class LocationScreen extends StatefulWidget {
  final dynamic weatherData;
  const LocationScreen({Key? key, this.weatherData}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.weatherData);
    print("inside locationScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.weatherData['main']['temp'].toString(),
              style: kTextStyle,
            ),
            Text(
              widget.weatherData['weather'][0]['id'].toString(),
              style: kTextStyle,
            ),
            Text(
              widget.weatherData['name'].toString(),
              style: kTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

// var temp = decodedData['main']['temp'];
// var condition = decodedData['weather'][0]['id'];
// var cityName = decodedData['name'];
//
// test = [temp, condition, cityName];
