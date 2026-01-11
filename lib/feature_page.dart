import 'package:agrocare/constants.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class FeaturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        gradient: LinearGradient(
          colors: [Color(0xFF43A047), Color(0xFF1B5E20)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),

      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [


            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(Icons.agriculture,
                  size: 60, color: Color(0xFF2E7D32)),
            ),

            SizedBox(height: 20),

            Text(
              "AgroCare for Smart Farmers",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: agroFont,
                color: Colors.white,
              ),
            ),

             SizedBox(height: 20),

            Text("• Track real-time weather updates",
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            Text("• Get crop-friendly climate insights",
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            Text("• Plan irrigation efficiently",
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            Text("• Improve farm productivity smartly",
                style: TextStyle(color: Colors.white70, fontSize: 16)),


            SizedBox(height: 15),

            featureText("Monitor crop health"),
            featureText("Get soil & weather insights"),
            featureText("Receive irrigation alerts"),
            featureText("Improve farming productivity"),

            SizedBox(height: 25),


          ],
        ),
      ),
    );
  }

  Widget featureText(String text) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 6),
      child: Text(
        "• $text",
        style: TextStyle(
          fontSize: 16,
          fontFamily: agroFont,
          color: Colors.white70,
        ),
      ),
    );
  }
}
