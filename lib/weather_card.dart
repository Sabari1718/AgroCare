import 'package:agrocare/constants.dart';
import 'package:agrocare/detail_screen.dart';
import 'package:agrocare/weather_model.dart';
import 'package:agrocare/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import '../utils/constants.dart';
import '../detail_screen.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;
   WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context, listen: false);

    return Container(
      width: 320,
      padding:  EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardOverlay,
        borderRadius: BorderRadius.circular(20),
        boxShadow:  [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(2, 4),
          )
        ],
      ),
      child: Column(
        children: [


          Text(
            "SMART AGRICULTURE WEATHER",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: agroFont,
              letterSpacing: 1.3,
              color: Colors.yellow,
              shadows:  [
                Shadow(
                  blurRadius: 4,
                  color: Colors.black45,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),

           SizedBox(height: 15),


          Text(
            provider.searchedLocation.toUpperCase(),
            style:  TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: agroFont,
              letterSpacing: 1.2,
            ),
          ),

           SizedBox(height: 12),

          Text(
            "🌡 Temperature: ${weather.temp.toStringAsFixed(1)}°C",
            style:  TextStyle(color: Colors.white, fontSize: 18),
          ),

           SizedBox(height: 8),

          Text(
            "💨 Wind Speed: ${weather.wind.toStringAsFixed(1)} km/h",
            style:  TextStyle(color: Colors.white, fontSize: 16),
          ),

           SizedBox(height: 8),

          Text(
            "💧 Humidity: ${weather.humidity}%",
            style:  TextStyle(color: Colors.white, fontSize: 16),
          ),

           SizedBox(height: 8),

          Text(
            "☁ Condition: ${weather.desc}",
            style:  TextStyle(color: Colors.white, fontSize: 16),
          ),

           SizedBox(height: 18),


          SizedBox(
            width: 140,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(weather: weather),
                  ),
                );
              },
              child:  Text(
                "Click",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
