import 'package:agrocare/constants.dart';
import 'package:agrocare/weather_card.dart';
import 'package:agrocare/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "AgroCare 🌾",
          style: TextStyle(fontFamily: agroFont),
        ),
        backgroundColor: primaryColor,
      ),

      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/farm.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          children: [
             SizedBox(height: 20),


            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: searchController,


                onSubmitted: (value) {
                  String city = value.trim();
                  if (city.isNotEmpty) {
                    weatherProvider.fetchWeather(city);
                  }
                },

                style:  TextStyle(
                  fontFamily: agroFont,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Enter City or Village Name",
                  hintStyle:  TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon:  Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      String city = searchController.text.trim();
                      if (city.isNotEmpty) {
                        weatherProvider.fetchWeather(city);
                      }
                    },
                  ),
                ),
              ),
            ),

             SizedBox(height: 20),


            Expanded(
              child: Center(
                child: weatherProvider.isLoading
                    ?  CircularProgressIndicator()

                    : weatherProvider.errorMessage != null
                    ? Text(
                  weatherProvider.errorMessage!,
                  style:  TextStyle(
                    fontSize: 18,
                    fontFamily: agroFont,
                    color: Colors.redAccent,
                  ),
                  textAlign: TextAlign.center,
                )

                    : weatherProvider.weather == null
                    ?  Text(
                  "Search a city or village to get weather 🌱",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: agroFont,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                )

                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                     Text(
                      "YOUR FARMING WEATHER REPORT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.3,
                        fontFamily: agroFont,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            color: Colors.black54,
                            blurRadius: 6,
                            offset: Offset(2, 2),
                          )
                        ],
                      ),
                    ),

                     SizedBox(height: 20),


                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(
                              weather:
                              weatherProvider.weather!,
                            ),
                          ),
                        );
                      },
                      child: WeatherCard(
                        weather: weatherProvider.weather!,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
