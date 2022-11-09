import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_jbc/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(
                  'JBC Todo',
                  textStyle: const TextStyle(
                    // fontFamily: 'Horizon',
                    color: themeColor,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FadeAnimatedText(
                  'JBC 全て',
                  textStyle: const TextStyle(
                      color: themeColor,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
