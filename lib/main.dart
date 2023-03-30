import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toonflix/screens/binding/bindings.dart';
import 'package:toonflix/screens/state.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  tz.initializeTimeZones();
  runApp(const App());
  
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      initialBinding: AppBindings(),
      home: const Statemain());
  }
}
