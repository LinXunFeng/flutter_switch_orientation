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
    var rotateOrientation: UIInterfaceOrientation = .portrait
    for orientation in orientations {
      switch orientation {
      case .portraitUp:
        supportInterfaceOrientation = supportInterfaceOrientation.union(.portrait)
      case .landscapeLeft:
        supportInterfaceOrientation = supportInterfaceOrientation.union(.landscapeLeft)
        rotateOrientation = .landscapeRight
      case .portraitDown:
        supportInterfaceOrientation = supportInterfaceOrientation.union(.portraitUpsideDown)
      case .landscapeRight:
        supportInterfaceOrientation = supportInterfaceOrientation.union(.landscapeRight)
        rotateOrientation = .landscapeLeft
      }
    }
    
    let config = FullScreenableConfig(
      enterFullScreenOrientation: rotateOrientation,
      supportInterfaceOrientation: supportInterfaceOrientation
    )
    UIApplication.shared.lxf.setCurrentFullScreenConfig(isEnter: false, config: config)
    UIApplication.shared.lxf.rotate(with: rotateOrientation)
  }
}
  
