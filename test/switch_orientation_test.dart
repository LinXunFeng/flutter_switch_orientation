// import 'package:flutter_test/flutter_test.dart';
// import 'package:switch_orientation/switch_orientation.dart';
// import 'package:switch_orientation/switch_orientation_platform_interface.dart';
// import 'package:switch_orientation/switch_orientation_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockSwitchOrientationPlatform
//     with MockPlatformInterfaceMixin
//     implements SwitchOrientationPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final SwitchOrientationPlatform initialPlatform = SwitchOrientationPlatform.instance;

//   test('$MethodChannelSwitchOrientation is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelSwitchOrientation>());
//   });

//   test('getPlatformVersion', () async {
//     SwitchOrientation switchOrientationPlugin = SwitchOrientation();
//     MockSwitchOrientationPlatform fakePlatform = MockSwitchOrientationPlatform();
//     SwitchOrientationPlatform.instance = fakePlatform;

//     expect(await switchOrientationPlugin.getPlatformVersion(), '42');
//   });
// }
