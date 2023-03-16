import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cityName = "";

    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.xmark),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: kMainBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: kTextFieldInputDecoration,
              onChanged: (value) {
                cityName = value;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, cityName);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white12),
            child: Text(
              "Get Weather",
              style: kTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
