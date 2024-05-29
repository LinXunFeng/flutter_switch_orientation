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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SwitchOrientation'),
        ),
        body: ListView(
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
                  DeviceOrientation.portraitUp,
                ]);
              },
              child: const Text('PortraitUp'),
            ),
            ElevatedButton(
              onPressed: () {
                SwitchOrientation.setPreferredOrientations([
                  DeviceOrientation.portraitDown,
                ]);
              },
              child: const Text('PortraitDown'),
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
                SwitchOrientation.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                ]);
              },
              child: const Text('LandscapeLeft'),
            ),
            ElevatedButton(
              onPressed: () {
                SwitchOrientation.setPreferredOrientations([
                  DeviceOrientation.landscapeRight,
                ]);
              },
              child: const Text('LandscapeRight'),
            ),
            ElevatedButton(
              onPressed: () {
                SwitchOrientation.setPreferredOrientations([]);
              },
              child: const Text('All without orientations'),
            ),
            ElevatedButton(
              onPressed: () {
                SwitchOrientation.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                ]);
              },
              child: const Text('All'),
            ),
          ],
        ),
      ),
    );
  }
}
