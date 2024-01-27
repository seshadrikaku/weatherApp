import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import '../Screens/Home/data.dart';

part 'weather_bloc_exmple_event.dart';
part 'weather_bloc_exmple_state.dart';

class WeatherBlocExmpleBloc
    extends Bloc<WeatherBlocExmpleEvent, WeatherBlocExmpleState> {
  WeatherBlocExmpleBloc() : super(WeatherBlocExmpleInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocExmpleLoading());
      try {
        WeatherFactory weatherFactory =
            WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await weatherFactory.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        emit(WeatherBlocExmpleSucess(weather));
        print(weather);
      } catch (e) {
        emit(WeatherBlocExmpleFailure());
      }
    });
  }
}
