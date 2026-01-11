import 'package:agrocare/constants.dart';
import 'package:agrocare/weather_model.dart';
import 'package:agrocare/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/weather_model.dart';
import '../providers/weather_provider.dart';
import '../utils/constants.dart';

class DetailScreen extends StatelessWidget {
  final Weather weather;
   DetailScreen({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<WeatherProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Weather Details 🌤️",
          style: TextStyle(fontFamily: agroFont),
        ),
        backgroundColor: primaryColor,
      ),
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: Container(
            width: 320,
            padding:  EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient:  LinearGradient(
                colors: [Color(0xff0f4c75), Color(0xff3282b8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [


                Row(
                  children: [
                     Icon(Icons.location_on, color: Colors.redAccent),
                     SizedBox(width: 6),
                    Text(
                      "City: ${provider.searchedLocation.toUpperCase()}",
                      style:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: agroFont,
                      ),
                    ),
                  ],
                ),

                 SizedBox(height: 12),

                Row(
                  children: [
                     Icon(Icons.thermostat, color: Colors.orangeAccent),
                     SizedBox(width: 6),
                    Text(
                      "Temperature: ${weather.temp.toStringAsFixed(1)}°C",
                      style:  TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),

                 SizedBox(height: 8),

                Row(
                  children: [
                     Icon(Icons.air, color: Colors.lightBlueAccent),
                     SizedBox(width: 6),
                    Text(
                      "Wind Speed: ${weather.wind.toStringAsFixed(1)} km/h",
                      style:  TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),

                 SizedBox(height: 8),

                Row(
                  children: [
                     Icon(Icons.water_drop, color: Colors.blueAccent),
                     SizedBox(width: 6),
                    Text(
                      "Humidity: ${weather.humidity}%",
                      style:  TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),

                 SizedBox(height: 8),

                Row(
                  children: [
                     Icon(Icons.cloud, color: Colors.yellowAccent),
                     SizedBox(width: 6),
                    Text(
                      "Condition: ${weather.desc}",
                      style:  TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),

                 SizedBox(height: 18),

                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon:  Icon(Icons.arrow_back),
                  label:  Text("Go Back"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
