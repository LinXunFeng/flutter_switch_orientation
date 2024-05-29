# switch_orientation

A Flutter plugin that switches device orientation.

## ☕ Support me

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/T6T4JKVRP) [![wechat](https://img.shields.io/static/v1?label=WeChat&message=WeChat&nbsp;Pay&color=brightgreen&style=for-the-badge&logo=WeChat)](https://cdn.jsdelivr.net/gh/FullStackAction/PicBed@resource20220417121922/image/202303181116760.jpeg)

Chat: [Join WeChat group](https://mp.weixin.qq.com/s/JBbMstn0qW6M71hh-BRKzw)

## 📦 Installing

Add `switch_orientation` to your pubspec.yaml file:


```yaml
dependencies:
  switch_orientation: latest_version
```

Import `switch_orientation` in files that it will be used:

```dart
import 'package:switch_orientation/switch_orientation.dart';
```

## 📚 Usage

### iOS

In `AppDelegate`

```swift
import LXFProtocolTool

func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    return UIApplication.shared.lxf.currentVcOrientationMask
}
```

### Android

Nothing to do.


### Dart

```dart
SwitchOrientation.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
  DeviceOrientation.landscapeLeft,
  DeviceOrientation.landscapeRight,
]);
```

## FAQ

- [Flutter: Failed to change device orientation on Ipad](https://stackoverflow.com/a/77798647/8577739)
- [How to enable upside down orientation on flutter for iOS?](https://stackoverflow.com/a/70011271/8577739)

## 🖨 About Me

- GitHub: [https://github.com/LinXunFeng](https://github.com/LinXunFeng)
- Email: [linxunfeng@yeah.net](mailto:linxunfeng@yeah.net)
- Blogs: 
  - 全栈行动: [https://fullstackaction.com](https://fullstackaction.com)
  - 掘金: [https://juejin.cn/user/1820446984512392](https://juejin.cn/user/1820446984512392) 

<img height="267.5" width="481.5" src="https://github.com/LinXunFeng/LinXunFeng/raw/master/static/img/FSAQR.png"/>

