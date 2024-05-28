import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:switch_orientation/switch_orientation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SwitchOrientation.setPreferredOrientations([]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                SwitchOrientation.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]);
              },
              child: const Text('Portrait'),
            ),
            ElevatedButton(
              onPressed: () {
                SwitchOrientation.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                ]);
              },
              child: const Text('Landscape'),
            ),
            ElevatedButton(
              onPressed: () {
                SwitchOrientation.setPreferredOrientations([]);
              },
              child: const Text('All'),
            ),
          ],
        ),
      ),
    );
  }
}
