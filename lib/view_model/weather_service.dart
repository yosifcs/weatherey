import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../model/weather_model.dart';

class WeatherService {
  Dio dio = Dio();
  static const Base_URL = "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherService(this.apiKey);

  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final response = await dio.get(
        "$Base_URL?q=$cityName&appid=$apiKey&units=metric",
      );

      if (response.statusCode == 200) {
        // If the API call is successful, parse the JSON response
        return WeatherModel.fromJson(response.data);
      } else {
        // If the API call fails, throw an exception
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      // Catch any Dio errors or exceptions
      throw Exception('Failed to load weather data: $e');
    }
  }

  Future<String> getCurrentCity() async {
    try {
      LocationPermission locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
      }
      if (locationPermission == LocationPermission.deniedForever) {
        throw Exception('Location permission is permanently denied.');
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
      String? city = placemarks.isNotEmpty ? placemarks[0].locality : null;
      if (city == null) {
        throw Exception('Unable to determine current city.');
      }
      return city;
    } catch (e) {
      throw Exception('Failed to fetch current city: $e');
    }
  }
}
