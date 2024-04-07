class WeatherModel {
  final String cityName;
  final double windSpeed;
  final double windDegree;
  final double temp;
  final double humidity;
  final String mainCondition;

  WeatherModel(
      {required this.cityName,
      required this.humidity,
      required this.temp,
      required this.windSpeed,
      required this.windDegree,
      required this.mainCondition});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temp: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      humidity: json['main']['humidity'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      windDegree: json['wind']['deg'].toDouble(),
    );
  }
}
