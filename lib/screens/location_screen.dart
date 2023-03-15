import 'package:clima/components/reusable_card.dart';
import 'package:clima/components/weather_card.dart';
import 'package:clima/services/weather_data.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocationScreen extends StatefulWidget {
  final WeatherData weatherData;
  const LocationScreen({Key? key, required this.weatherData}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String msg = widget.weatherData.getTemperatureMessage().toString();
    String cityName = widget.weatherData.getCityName();
    String temp = widget.weatherData.getTemperature().toString();
    String conditionIcon = widget.weatherData.getConditionIcon();
    String conditionDescription = widget.weatherData.getConditionDescription();
    String condition = "$conditionIcon $conditionDescription";

    DateTime nw = DateTime.now();
    String date =
        (DateFormat('EEEE, d MMM').format(nw)); // prints Tuesday, 10 Dec, 2019
    String time = (DateFormat('h:mm a').format(nw)); // prints 10:02 AM

    // Color bgColor = widget.weatherData.getBackgroundColor();

    return Scaffold(
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
              child: Image.asset(
                widget.weatherData.getConditionAssetImage(),
              ),
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
}
