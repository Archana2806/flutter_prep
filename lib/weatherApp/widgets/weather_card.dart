import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final Map<String, dynamic> weatherData;
  WeatherCard(this.weatherData);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(weatherData["name"], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Temp: ${weatherData["main"]["temp"]}°C"),
            Text("Condition: ${weatherData["weather"][0]["description"]}"),
            Text("Humidity: ${weatherData["main"]["humidity"]}%"),
          ],
        ),
      ),
    );
  }
}