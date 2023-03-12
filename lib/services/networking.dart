import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../utilities/constants.dart';

class NetworkHelper {
  Future getWeatherDataFromLocation(String lon, String lat) async {
    dynamic decodedData;

    final queryParameters = {
      'lat': lat,
      'lon': lon,
      'appid': kAppId,
    };

    /// from documentation --> Request url Should look like this:
    /// https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    var url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      queryParameters,
    );

    http.Response response = await http.get(url);

    dynamic test;
    if (response.statusCode == 200) {
      //parse response
      var data = response.body;
      decodedData = jsonDecode(data);
    } else {
      if (kDebugMode) {
        print(response.statusCode);
        print(response.reasonPhrase);
      }
    }
    if (kDebugMode) {
      print("url: $url");
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(test);
    }

    return decodedData;
  }
}
