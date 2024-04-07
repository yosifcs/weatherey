import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherey/bloc/weather_cubit.dart';
import 'package:weatherey/view/widgets/background.dart';
import '../view_model/weather_service.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherCubit(WeatherService("235357bf38d457ba7c63b78109197805"))
            ..getCurrentCityWeather(),
      child: const WeatherScreenBody(),
    );
  }
}

class WeatherScreenBody extends StatelessWidget {
  const WeatherScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeatherData(),
    );
  }
}

class WeatherData extends StatelessWidget {
  WeatherData({Key? key}) : super(key: key);
  TextStyle style =
      TextStyle(color: Colors.white, fontSize: 90, fontWeight: FontWeight.w500);
  TextStyle style2 =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return Center(child: Lottie.asset("assets/CircleIndicator.json"));
        } else if (state is WeatherLoaded) {
          return WeatherBackground(weather: state.weather);
        } else if (state is WeatherError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(
            child: Text('Press a button to fetch weather data.'),
          );
        }
      },
    );
  }
}
