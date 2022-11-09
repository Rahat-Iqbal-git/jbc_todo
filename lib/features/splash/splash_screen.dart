import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_jbc/common/widgets/horizontal_space.dart';
import 'package:todo_jbc/features/onboard/screens/onboard_screen.dart';
import 'package:todo_jbc/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => OnboardScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text(
                //   "JBC",
                //   style: GoogleFonts.lato(
                //     textStyle: const TextStyle(
                //       color: themeColor,
                //       fontSize: 30,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // const HorizontalSpace(width: 10),
                AnimatedTextKit(
                  animatedTexts: [
                    FadeAnimatedText('JBC Todo',
                        textStyle: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: themeColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    FadeAnimatedText('JBC 全て',
                        textStyle: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: themeColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                        // textStyle: const TextStyle(
                        //     color: themeColor,
                        //     fontSize: 32.0,
                        //     fontWeight: FontWeight.bold),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
