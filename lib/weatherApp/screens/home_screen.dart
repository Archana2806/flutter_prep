import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController cityController = TextEditingController();
  Map<String, dynamic>? weatherData;

  void fetchWeather() async {
    final data = await WeatherService.getWeather(cityController.text);
    setState(() {
      weatherData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather App")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: "Enter City",
                suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: fetchWeather),
              ),
            ),
            SizedBox(height: 20),
            weatherData != null
                ? WeatherCard(weatherData!)
                : Text("Enter a city to fetch weather", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}