import 'package:agrocare/constants.dart';
import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'feature_page.dart';
import 'home_screen.dart';
import '../utils/constants.dart';

class IntroPageView extends StatefulWidget {
  @override
  _IntroPageViewState createState() => _IntroPageViewState();
}

class _IntroPageViewState extends State<IntroPageView> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              WelcomePage(),
              FeaturePage(),
               HomeScreen(),
            ],
          ),


          Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: Column(
              children: [


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return AnimatedContainer(
                      duration:  Duration(milliseconds: 300),
                      margin:  EdgeInsets.all(4),
                      width: currentIndex == index ? 12 : 8,
                      height: currentIndex == index ? 12 : 8,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? Colors.white
                            : Colors.white54,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),

                 SizedBox(height: 6),


                if (currentIndex != 2)
                   Text(
                    "Swipe →",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontFamily: agroFont,
                      letterSpacing: 1.2,
                    ),
                  ),

                 SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
