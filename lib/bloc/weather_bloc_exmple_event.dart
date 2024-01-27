part of 'weather_bloc_exmple_bloc.dart';

sealed class WeatherBlocExmpleEvent extends Equatable {
  const WeatherBlocExmpleEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherBlocExmpleEvent {
  final Position position;

  const FetchWeather(this.position);

  @override
  List<Object> get props => [position];
}
