import 'package:flutter/material.dart';

///API data: OpenWeatherMap
const kAppId = "1bcbe727a72a05fbb4f5676f85cd5611";
const kAPIimagesUrlBase = "https://openweathermap.org/img/wn/";

///Colors
const kMainBackgroundColor = Color(0xC91E1331);
// const kSecondaryColor = Color(0x326D0262);
const kSecondaryColor = Color(0xC91E1331);
const kActiveCardColor = Color(0xFF1D1F33);
const kInactiveCardColor = Color(0xFF111328);

const List<Color> kSunnyColors = [Color(0xFFF9D776), Color(0xFFF3A483)];
// List<Color> CloudyColors = [Color(0xFF), Color(0xFF)];
// List<Color> RainyColors = [Color(0xFF), Color(0xFF)];

///measures
const kMarginNo = 15.0;
const int kHeightInit = 192;

///Gradients
const boxDecorationSunny = BoxDecoration(
  gradient: LinearGradient(
    colors: kSunnyColors,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

///Styles
ButtonStyle kButtonStyle = OutlinedButton.styleFrom(
  side: const BorderSide(
    color: Colors.white70,
    width: 2.0,
  ),
  backgroundColor: kMainBackgroundColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
);

const kTextStyle = TextStyle(
  fontSize: 30,
  color: Colors.white70,
  fontFamily: "Raleway",
  fontWeight: FontWeight.w900,
);

//colors
