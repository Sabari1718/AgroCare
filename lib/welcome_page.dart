import 'package:agrocare/constants.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(

        color: Colors.black.withOpacity(0.35),

        child: Center(
          child: Container(
            padding:  EdgeInsets.symmetric(horizontal: 22, vertical: 18),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.30),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withOpacity(0.25),
              ),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // 🌟 Title
                Text(
                  "SMART FARMING",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                    fontFamily: agroFont,
                    color:  Color(0xFFFFD700),
                    shadows:  [
                      Shadow(
                        color: Colors.black87,
                        blurRadius: 8,
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                ),

                 SizedBox(height: 12),


                Text(
                  "Empowering Farmers\nfor Tomorrow 🌱",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: agroFont,
                    color: Colors.white,
                    height: 1.5,
                    letterSpacing: 0.5,
                    shadows:  [
                      Shadow(
                        color: Colors.black54,
                        blurRadius: 5,
                        offset: Offset(1, 1),
                      ),
                    ],
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
