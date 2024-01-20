import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/view/bus_home.dart';

import 'package:test_app/view/splash_screen.dart';

import 'controller/bus_provider.dart';
import 'controller/login_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => BusProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
