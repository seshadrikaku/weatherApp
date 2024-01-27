import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostelcheck/bloc/weather_bloc_exmple_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> refreshData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 154, 155, 129)),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 218, 174, 189)),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1.2),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 130, 231, 130)),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                ),
                BlocBuilder<WeatherBlocExmpleBloc, WeatherBlocExmpleState>(
                  builder: (context, state) {
                    if (state is WeatherBlocExmpleSucess) {
                      return RefreshIndicator(
                        onRefresh: refreshData,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${state.weather.areaName}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white30),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'Good Morning',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'image/1.png',
                                      width: 200,
                                      height: 200,
                                    ),
                                  )
                                ],
                              ),
                              Center(
                                child: Text(
                                  '${state.weather.temperature!.celsius!.round()} °C',
                                  style: const TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '${state.weather.weatherMain}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Center(
                                child: Text(
                                  DateFormat('EEEE dd .')
                                      .add_j()
                                      .format(state.weather.date!),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                'image/11.png',
                                                scale: 10,
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const Row(
                                                children: [
                                                  Text(
                                                    'Sunrise',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    DateFormat('')
                                                        .add_j()
                                                        .format(state
                                                            .weather.sunrise!),
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                'image/12.png',
                                                scale: 10,
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const Row(
                                                children: [
                                                  Text(
                                                    'Sunset',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    DateFormat().add_j().format(
                                                        state.weather.sunset!),
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18),
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 0.5,
                                  height: 2,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                'image/13.png',
                                                scale: 10,
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const Row(
                                                children: [
                                                  Text(
                                                    'Temp Max',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${state.weather.tempMax!.celsius!.round()} °C",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                'image/14.png',
                                                scale: 10,
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const Row(
                                                children: [
                                                  Text(
                                                    'Temp Min',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${state.weather.tempMin!.celsius!.round()} °C",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            )),
      ),
    );
  }
}
