import 'package:flutter/material.dart';
import 'package:restaurant_app/core/location_service.dart';
import 'package:restaurant_app/screens/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocationService.getCurrentLocation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: HomeScreen(),
    );
  }
}
