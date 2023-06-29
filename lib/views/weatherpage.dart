import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String weatherData = '';

  Future<void> fetchWeather() async {
    final response = await http.get(Uri.parse('https://api.tomorrow.io/v4/timelines?location=40.75872069597532,-73.98529171943665&fields=temperature&timesteps=1h&units=metric&apikey=1Pj0UIyN6p7nJTXftzJdz8jblWrKeOVW'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        // Parse the weather data and update the state
        // Example: weatherData = data['temperature'];
      });
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Center(
        child: Text(
          weatherData,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}