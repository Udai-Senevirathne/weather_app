import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../bloc/weather_bloc_bloc.dart';
import 'weather_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _getWeather(BuildContext context) async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
    }

    final position = await Geolocator.getCurrentPosition();
    context.read<WeatherBloc>().add(FetchWeather(position));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: BlocConsumer<WeatherBloc, WeatherBlocState>(
        listener: (context, state) {
          if (state is WeatherBlocSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => WeatherDetailsScreen(
                  city: state.weather.areaName ?? 'Unknown',
                  temperature:
                      "${state.weather.temperature?.celsius?.toStringAsFixed(1)} °C",
                  condition: state.weather.weatherMain ?? '',
                  humidity: "${state.weather.humidity}%",
                  wind: "${state.weather.windSpeed} m/s",
                  feelsLike:
                      "${state.weather.tempFeelsLike?.celsius?.toStringAsFixed(1)} °C",
                ),
              ),
            );
          } else if (state is WeatherBlocFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to load weather')),
            );
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => _getWeather(context),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade900,
                    Colors.blue.shade700,
                    Colors.blue.shade400,
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      const Icon(
                        Icons.wb_sunny_rounded,
                        color: Colors.yellow,
                        size: 100,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Weatherly',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Tap anywhere to get live weather',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const Spacer(),
                      if (state is WeatherBlocLoading)
                        const CircularProgressIndicator(color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
