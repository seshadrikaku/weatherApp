part of 'weather_bloc_exmple_bloc.dart';

sealed class WeatherBlocExmpleState extends Equatable {
  const WeatherBlocExmpleState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocExmpleInitial extends WeatherBlocExmpleState {}

final class WeatherBlocExmpleLoading extends WeatherBlocExmpleState {}

final class WeatherBlocExmpleFailure extends WeatherBlocExmpleState {}

final class WeatherBlocExmpleSucess extends WeatherBlocExmpleState {
  final Weather weather;

  const WeatherBlocExmpleSucess(this.weather);

  @override
  List<Object> get props => [weather];
}
