import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherey/model/weather_model.dart';
import '../view_model/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;

  WeatherCubit(this.weatherService) : super(WeatherInitial());

  void fetchWeather(String cityName) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherService.getWeather(cityName);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError('Failed to fetch weather data: $e'));
    }
  }

  void getCurrentCityWeather() async {
    emit(WeatherLoading());
    try {
      final city = await weatherService.getCurrentCity();
      final weather = await weatherService.getWeather(city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError('Failed to fetch current city weather: $e'));
    }
  }
}
