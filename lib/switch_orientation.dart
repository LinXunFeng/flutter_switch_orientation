import 'dart:io';

import 'package:flutter/services.dart';
import 'package:switch_orientation/plugin/pigeon.g.dart';

class SwitchOrientation {
  static Future<void> setPreferredOrientations(
    List<DeviceOrientation> orientations,
  ) async {
    if (Platform.isIOS) {
      LXFDeviceOrientation? orientation0;
      LXFDeviceOrientation? orientation1;
      LXFDeviceOrientation? orientation2;
      LXFDeviceOrientation? orientation3;
      updateValue(int index, LXFDeviceOrientation orientation) {
        switch (index) {
          case 0:
            orientation0 = orientation;
            break;
          case 1:
            orientation1 = orientation;
            break;
          case 2:
            orientation2 = orientation;
            break;
          case 3:
            orientation3 = orientation;
            break;
        }
      }

      for (var i = 0; i < orientations.length; i++) {
        final orientation = orientations[i];
        LXFDeviceOrientation type;
        switch (orientation) {
          case DeviceOrientation.portraitUp:
            type = LXFDeviceOrientation.portraitUp;
            break;
          case DeviceOrientation.landscapeLeft:
            type = LXFDeviceOrientation.landscapeLeft;
            break;
          case DeviceOrientation.portraitDown:
            type = LXFDeviceOrientation.portraitDown;
            break;
          case DeviceOrientation.landscapeRight:
            type = LXFDeviceOrientation.landscapeRight;
            break;
        }
        updateValue(i, type);
      }
      return LXFSwitchOrientationHostApi().setPreferredOrientations(
        orientation0,
        orientation1,
        orientation2,
        orientation3,
      );
    }
    return SystemChrome.setPreferredOrientations(orientations);
  }
}
