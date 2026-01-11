class Weather {
  final double temp;
  final double wind;
  final int humidity;
  final String city;
  final String desc;

  Weather({
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.city,
    required this.desc,
  });


  factory Weather.fromJson(Map<String, dynamic> json) {
    try {
      return Weather(
        temp: (json['main']?['temp'] as num?)?.toDouble() ?? 0.0,
        wind: (json['wind']?['speed'] as num?)?.toDouble() ?? 0.0,
        humidity: (json['main']?['humidity'] as int?) ?? 0,
        city: json['name'] ?? "Unknown",
        desc: (json['weather'] != null && json['weather'].isNotEmpty)
            ? json['weather'][0]['description'] ?? "No data"
            : "No data",
      );
    } catch (e) {
      return Weather(
        temp: 0.0,
        wind: 0.0,
        humidity: 0,
        city: "Unknown",
        desc: "No data",
      );
    }
  }


  factory Weather.fromWeatherApiJson(Map<String, dynamic> json, String locationName) {
    try {
      return Weather(
        temp: (json['current']?['temp_c'] as num?)?.toDouble() ?? 0.0,
        wind: (json['current']?['wind_kph'] as num?)?.toDouble() ?? 0.0,
        humidity: (json['current']?['humidity'] as int?) ?? 0,
        city: locationName,
        desc: json['current']?['condition']?['text'] ?? "No data",
      );
    } catch (e) {
      return Weather(
        temp: 0.0,
        wind: 0.0,
        humidity: 0,
        city: locationName,
        desc: "No data",
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "temp": temp,
      "wind": wind,
      "humidity": humidity,
      "city": city,
      "desc": desc,
    };
  }
}
