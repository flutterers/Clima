import 'dart:async';

import 'package:clima/components/reusable_card.dart';
import 'package:clima/components/weather_card.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather_data.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services/weather_helper.dart';

class LocationScreen extends StatefulWidget {
  final WeatherData weatherData;

  const LocationScreen({Key? key, required this.weatherData}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // late WeatherData weatherData;
  late String msg;
  late String cityName;
  late String temp;
  late String conditionIcon;
  late String conditionDescription;
  late String conditionAssetImage;
  late String condition;
  late DateTime nw;
  late String date; // prints Tuesday, 10 Dec, 2019
  late String time; // prints 10:02 AM
  late Timer timer;

  @override
  void initState() {
    super.initState();
    var weatherData = widget.weatherData;
    msg = weatherData.getTemperatureMessage().toString();
    cityName = weatherData.getCityName();
    temp = weatherData.getTemperature().toString();
    conditionIcon = weatherData.getConditionIcon();
    conditionAssetImage = weatherData.getConditionAssetImage();
    conditionDescription = weatherData.getConditionDescription();
    condition = "$conditionIcon $conditionDescription";

    nw = DateTime.now();
    date =
        (DateFormat('EEEE, d MMM').format(nw)); // prints Tuesday, 10 Dec, 2019
    time = (DateFormat('h:mm a').format(nw));
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    setState(() {
      nw = DateTime.now();
      date = (DateFormat('EEEE, d MMM')
          .format(nw)); // prints Tuesday, 10 Dec, 2019
      time = (DateFormat('h:mm a').format(nw));
    });
  }

  void updateUI(WeatherData weatherDataNew) {
    setState(() {
      msg = weatherDataNew.getTemperatureMessage().toString();
      cityName = weatherDataNew.getCityName();
      temp = weatherDataNew.getTemperature().toString();
      conditionIcon = weatherDataNew.getConditionIcon();
      conditionAssetImage = weatherDataNew.getConditionAssetImage();
      conditionDescription = weatherDataNew.getConditionDescription();
      condition = "$conditionIcon $conditionDescription";

      nw = DateTime.now();
      date = (DateFormat('EEEE, d MMM')
          .format(nw)); // prints Tuesday, 10 Dec, 2019
      time = (DateFormat('h:mm a').format(nw)); // prints 10:02 AM
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      nw = DateTime.now();
    });
    // Color bgColor = widget.weatherData.getBackgroundColor();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainBackgroundColor,
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.locationArrow),
          onPressed: () async {
            var weatherData = await WeatherHelper().getLocationWeatherData();
            updateUI(weatherData);
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var TypedCity = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityScreen(),
                ),
              );
              print("Typed City: $TypedCity");
              if (TypedCity != "") {
                dynamic newWeatherData =
                    await WeatherHelper().getCityWeatherData(TypedCity);
                updateUI(newWeatherData);
              }
            },
            icon: FaIcon(FontAwesomeIcons.city),
          ),
        ],
      ),
      backgroundColor: kMainBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                date,
                style: kTextStyle.copyWith(fontSize: 20),
              ),
            ),
            Text(
              time,
              style: kTextStyle.copyWith(fontSize: 45),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                cityName,
                style: kTextStyle.copyWith(fontSize: 20),
              ),
            ),
            Expanded(
              child: Image.asset(conditionAssetImage),
            ),
            Text(
              "$temp°",
              style: kTextStyle.copyWith(fontSize: 90),
              textAlign: TextAlign.center,
            ),
            Text(
              conditionDescription,
              style: kTextStyle.copyWith(fontSize: 26),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Container(
                width: 300,
                height: 2,
                color: Colors.white70,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                      cardChild: SizedBox(
                        width: 5,
                        height: 100,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              msg,
                              textAlign: TextAlign.justify,
                              style: kTextStyle.copyWith(
                                  fontSize: 24.0, color: Colors.white60),
                            ),
                          ),
                        ),
                      ),
                      cardColor: kSecondaryColor,
                      onPressed: () {}),
                ),
                // Expanded(
                //   child: ReusableCard(
                //       cardChild: Container(
                //         width: 5,
                //         height: 100,
                //       ),
                //       cardColor: kActiveCardColor,
                //       onPressed: () {}),
                // ),
                // Expanded(
                //   child: ReusableCard(
                //       cardChild: Container(
                //         width: 5,
                //         height: 100,
                //         child: WeatherCard(
                //             date: date, weatherData: widget.weatherData),
                //       ),
                //       cardColor: kActiveCardColor,
                //       onPressed: () {}),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    timer.cancel();
    super.deactivate();
  }
}
