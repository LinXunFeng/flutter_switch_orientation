import 'package:pigeon/pigeon.dart';

// https://github.com/flutter/packages/blob/main/packages/pigeon/example/README.md
@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/plugin/pigeon.g.dart',
  swiftOut: 'ios/Classes/LXFSwitchOrientationGeneratedApis.g.swift',
))
enum LXFDeviceOrientation {
  /// If the device shows its boot logo in portrait, then the boot logo is shown
  /// in [portraitUp]. Otherwise, the device shows its boot logo in landscape
  /// and this orientation is obtained by rotating the device 90 degrees
  /// clockwise from its boot orientation.
  portraitUp,

  /// The orientation that is 90 degrees clockwise from [portraitUp].
  ///
  /// If the device shows its boot logo in landscape, then the boot logo is
  /// shown in [landscapeLeft].
  landscapeLeft,

  /// The orientation that is 180 degrees from [portraitUp].
  portraitDown,

  /// The orientation that is 90 degrees counterclockwise from [portraitUp].
  landscapeRight,
}

@HostApi()
abstract class LXFSwitchOrientationHostApi {
  // Pigeon still does not support collections of enums though.
  // https://github.com/flutter/flutter/issues/133728
  void setPreferredOrientations(
    LXFDeviceOrientation? orientation0,
    LXFDeviceOrientation? orientation1,
    LXFDeviceOrientation? orientation2,
    LXFDeviceOrientation? orientation3,
  );
}
