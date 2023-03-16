import 'package:clima/services/weather_data.dart';
import '../utilities/constants.dart';
import 'location.dart';
import 'networking.dart';

class WeatherHelper {
  late String lon;
  late String lat;
  late dynamic weatherDecodedJsonData;

  Future getLocationWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    var queryParameters = {
      'lat': location.lat.toString(),
      'lon': location.long.toString(),
      'appid': kAppId,
      'units': 'metric',
    };
    dynamic weatherData = await _sendRequestGetResponse(queryParameters);
    return WeatherData(weatherDataDecoded: weatherData);
  }

  Future getCityWeatherData(String cityName) async {
    var queryParameters = {
      'q': cityName,
      'appid': kAppId,
      'units': 'metric',
    };
    dynamic weatherData = await _sendRequestGetResponse(queryParameters);
    return WeatherData(weatherDataDecoded: weatherData);
  }

  Future _sendRequestGetResponse(queryParameters) async {
    /// from documentation --> Request url Should look like this:
    /// https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    var url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      queryParameters,
    );
    weatherDecodedJsonData = await NetworkHelper().getHttpResponse(url);
    return weatherDecodedJsonData;
  }
}
