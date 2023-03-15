import 'package:clima/services/weather_data.dart';
import 'location.dart';
import 'networking.dart';

class WeatherHelper {
  late final String lon;
  late final String lat;
  late final dynamic weatherData;

  Future getLocationWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    lon = location.long.toStringAsFixed(2);
    lat = location.lat.toStringAsFixed(2);
    weatherData = await NetworkHelper().getWeatherDataFromLocation(lon, lat);
    return WeatherData(weatherDataDecoded: weatherData);
  }
}
