import 'api_key.dart';
import 'location.dart';
import 'networking.dart';

class WeatherModel {
  static const String _baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> getLocationWeather() async {
    _checkApiKey();

    final position = await LocationService().getCurrentLocation();

    final url = Uri.parse(_baseUrl).replace(
      queryParameters: {
        'lat': position.latitude.toString(),
        'lon': position.longitude.toString(),
        'appid': openWeatherApiKey,
        'units': 'metric',
      },
    );

    return NetworkHelper(url).getData();
  }

  Future<Map<String, dynamic>> getCityWeather(String cityName) async {
    _checkApiKey();

    final url = Uri.parse(_baseUrl).replace(
      queryParameters: {
        'q': cityName,
        'appid': openWeatherApiKey,
        'units': 'metric',
      },
    );

    return NetworkHelper(url).getData();
  }

  void _checkApiKey() {
    if (openWeatherApiKey.isEmpty) {
      throw Exception(
        'OPENWEATHER_API_KEY is missing. '
        'Run Flutter with --dart-define.',
      );
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '⛈️';
    } else if (condition < 400) {
      return '🌧️';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '❄️';
    } else if (condition < 800) {
      return '🌫️';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    }

    return '🌡️';
  }

  String getMessage(int temperature) {
    if (temperature > 30) {
      return 'It is really hot today';
    } else if (temperature > 25) {
      return 'Perfect weather for some ice cream';
    } else if (temperature > 20) {
      return 'A comfortable day outside';
    } else if (temperature < 10) {
      return 'Keep yourself warm';
    }

    return 'Bring a jacket just in case';
  }
}
