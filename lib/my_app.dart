import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_jbc/features/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              fontSizeFactor: 1,
              // fontSizeDelta: 2.0,
            ),
      ),
      home: const SplashScreen(),
    );
  }
}
