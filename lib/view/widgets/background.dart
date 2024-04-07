import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherey/model/weather_model.dart';

class WeatherBackground extends StatelessWidget {
  final WeatherModel weather;

  const WeatherBackground({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
        color: Colors.white, fontSize: 90, fontWeight: FontWeight.w500);
    TextStyle style2 = const TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500);
    return Stack(
      children: [
        Image.network(
          "https://i.pinimg.com/originals/96/df/d4/96dfd411ab0e68f8bc1eb47e4eee8771.gif",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                leading: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 28,
                ),
                actions: [
                  Lottie.asset("assets/raining.json"),
                ],
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  weather.cityName, // Use weather data here
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    '${weather.temp.round()}\u00B0C',
                    style: style,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " ${weather.mainCondition} ",
                        style: style2,
                      ),
                      Text(
                        '${weather.windSpeed}\u00B0/',
                        style: style2,
                      ),
                      Text(
                        '${weather.windDegree.round()}\u00B0',
                        style: style2,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: double.infinity,
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Humidity",
                          style: style2,
                        ),
                        Text(
                          '${weather.humidity}%',
                          style: style2,
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wind Speed",
                          style: style2,
                        ),
                        Text(
                          '${weather.windSpeed}\u00B0',
                          style: style2,
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wind Degree",
                          style: style2,
                        ),
                        Text(
                          '${weather.windDegree}\u00B0',
                          style: style2,
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pressure",
                          style: style2,
                        ),
                        Text(
                          '${weather.humidity}mbar',
                          style: style2,
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
