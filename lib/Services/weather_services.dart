import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/data.dart';

class WeatherService {
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, String>> fetchWeather(String city) async {
    final url = Uri.parse('$baseUrl?q=$city&appid=$api_key&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return {
        'city': data['name'],
        'temperature': '${data['main']['temp']}°C',
        'condition': data['weather'][0]['main'],
        'humidity': '${data['main']['humidity']}%',
        'wind': '${data['wind']['speed']} km/h',
        'feelsLike': '${data['main']['feels_like']}°C',
      };
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
