import Flutter
import UIKit
import LXFProtocolTool

public class SwitchOrientationPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    LXFSwitchOrientationHostApiSetup.setUp(
      binaryMessenger: registrar.messenger(), 
      api: LXFSwitchOrientationHostApiImplementation()
    )
  }
}

class LXFSwitchOrientationHostApiImplementation: LXFSwitchOrientationHostApi {
  func setPreferredOrientations(
    orientation0: LXFDeviceOrientation?,
    orientation1: LXFDeviceOrientation?,
    orientation2: LXFDeviceOrientation?,
    orientation3: LXFDeviceOrientation?
  ) throws {
    var orientations: [LXFDeviceOrientation] = []
    if orientation0 != nil { orientations.append(orientation0!) }
    if orientation1 != nil { orientations.append(orientation1!) }
    if orientation2 != nil { orientations.append(orientation2!) }
    if orientation3 != nil { orientations.append(orientation3!) }
    
    var supportInterfaceOrientation : UIInterfaceOrientationMask = []
    for orientation in orientations {
      switch orientation {
      case .portraitUp:
        supportInterfaceOrientation = supportInterfaceOrientation.union(.portrait)
      case .landscapeLeft:
        supportInterfaceOrientation = supportInterfaceOrientation.union(.landscapeRight)
      case .portraitDown:
        supportInterfaceOrientation = supportInterfaceOrientation.union(.portraitUpsideDown)
      case .landscapeRight:
        supportInterfaceOrientation = supportInterfaceOrientation.union(.landscapeLeft)
      }
    }
    
    var rotateOrientation: UIInterfaceOrientation = .portrait
    let currentOrientationMask = UIDevice.current.orientation.toUIInterfaceOrientationMask
    if let mask = currentOrientationMask, supportInterfaceOrientation.isEmpty || supportInterfaceOrientation.contains(mask) {
      // supportInterfaceOrientation contains the current screen orientation.
      // Use the current screen orientation to trigger a rotation, otherwise there will be an exception.
      if let currentInterfaceOrientation = UIDevice.current.orientation.toUIInterfaceOrientation {
        rotateOrientation = currentInterfaceOrientation
      }
    } else {
      // supportedInterfaceOrientation does not contain the current screen orientation.
      if supportInterfaceOrientation.contains(.portrait) {
        rotateOrientation = .portrait
      } else if supportInterfaceOrientation.contains(.portraitUpsideDown) {
        rotateOrientation = .portraitUpsideDown
      } else {
        if supportInterfaceOrientation.contains(.landscape) {
          rotateOrientation = .landscapeRight
          if UIApplication.shared.statusBarOrientation == .landscapeLeft {
            //
            rotateOrientation = .landscapeLeft
          }
        } else if supportInterfaceOrientation.contains(.landscapeLeft) {
          rotateOrientation = .landscapeLeft
        } else if supportInterfaceOrientation.contains(.landscapeRight) {
          rotateOrientation = .landscapeRight
        }
      }
    }
    
    let config = FullScreenableConfig(
      enterFullScreenOrientation: rotateOrientation,
      supportInterfaceOrientation: supportInterfaceOrientation
    )
    DispatchQueue.main.async {
      UIApplication.shared.lxf.setCurrentFullScreenConfig(isEnter: false, config: config)
      UIApplication.shared.lxf.rotate(with: UIApplication.shared.statusBarOrientation)
      UIApplication.shared.lxf.rotate(with: rotateOrientation)
    }
  }
}

//fileprivate extension UIInterfaceOrientation {
//  var toMask: UIInterfaceOrientationMask? {
//    switch self {
//    case .portrait:
//      return .portrait
//    case .portraitUpsideDown:
//      return .portraitUpsideDown
//    case .landscapeLeft:
//      return .landscapeLeft
//    case .landscapeRight:
//      return .landscapeRight
//    default:
//      return nil
//    }
//  }
//}

fileprivate extension UIDeviceOrientation  {
   var toUIInterfaceOrientationMask: UIInterfaceOrientationMask? {
    switch self {
    case .portrait:
      return .portrait
    case .portraitUpsideDown:
      return .portraitUpsideDown
    case .landscapeLeft:
      return .landscapeRight
    case .landscapeRight:
      return .landscapeLeft
    default:
      return nil
    }
  }
  
  var toUIInterfaceOrientation: UIInterfaceOrientation? {
   switch self {
   case .portrait:
     return .portrait
   case .portraitUpsideDown:
     return .portraitUpsideDown
   case .landscapeLeft:
     return .landscapeRight
   case .landscapeRight:
     return .landscapeLeft
   default:
     return nil
   }
 }
}
