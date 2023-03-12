import 'package:flutter/material.dart';

//API data: OpenWeatherMap
const kAppId = "1bcbe727a72a05fbb4f5676f85cd5611";
// const kAppId = "0037032741e25248253fefbaf7b2a81e";

const kMainBackgroundColor = Color(0xC91E1331);
const kSecondaryColor = Color(0x291E1331);
// const kSecondaryColor = Color(0xFFA93E8E);
// const kSecondaryColor = Color(0x494E368A);

ButtonStyle kButtonStyle = OutlinedButton.styleFrom(
  side: const BorderSide(
    color: Colors.white70,
    width: 2.0,
  ),
  backgroundColor: kMainBackgroundColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
);

const kTextStyle =
    TextStyle(fontSize: 30, color: Colors.white70, fontFamily: "Molle");
