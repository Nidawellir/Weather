// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Colors {
    internal enum Common {
      internal static let black = ColorAsset(name: "Colors/Common/black")
      internal static let white = ColorAsset(name: "Colors/Common/white")
    }
    internal enum CurrenWeather {
      internal enum Gradients {
        internal enum Day {
          internal enum Main {
            internal static let bottom = ColorAsset(name: "Colors/CurrenWeather/Gradients/Day/Main/bottom")
            internal static let top = ColorAsset(name: "Colors/CurrenWeather/Gradients/Day/Main/top")
          }
          internal enum Secondary {
            internal static let bottom = ColorAsset(name: "Colors/CurrenWeather/Gradients/Day/Secondary/bottom")
            internal static let top = ColorAsset(name: "Colors/CurrenWeather/Gradients/Day/Secondary/top")
          }
        }
        internal enum Night {
          internal enum Main {
            internal static let bottom = ColorAsset(name: "Colors/CurrenWeather/Gradients/Night/Main/bottom")
            internal static let top = ColorAsset(name: "Colors/CurrenWeather/Gradients/Night/Main/top")
          }
          internal enum Secondary {
            internal static let bottom = ColorAsset(name: "Colors/CurrenWeather/Gradients/Night/Secondary/bottom")
            internal static let top = ColorAsset(name: "Colors/CurrenWeather/Gradients/Night/Secondary/top")
          }
        }
        internal enum Sunset {
          internal enum Main {
            internal static let bottom = ColorAsset(name: "Colors/CurrenWeather/Gradients/Sunset/Main/bottom")
            internal static let top = ColorAsset(name: "Colors/CurrenWeather/Gradients/Sunset/Main/top")
          }
          internal enum Secondary {
            internal static let bottom = ColorAsset(name: "Colors/CurrenWeather/Gradients/Sunset/Secondary/bottom")
            internal static let top = ColorAsset(name: "Colors/CurrenWeather/Gradients/Sunset/Secondary/top")
          }
        }
      }
    }
    internal enum DailyWeather {
      internal enum HourlyWeather {
        internal static let roundedContainerViewBackground = ColorAsset(name: "Colors/DailyWeather/HourlyWeather/roundedContainerViewBackground")
      }
      internal static let delimiterViewBackground = ColorAsset(name: "Colors/DailyWeather/delimiterViewBackground")
      internal static let roundedContainerViewBackground = ColorAsset(name: "Colors/DailyWeather/roundedContainerViewBackground")
      internal static let titleColor = ColorAsset(name: "Colors/DailyWeather/titleColor")
    }
  }
  internal enum Images {
    internal enum Common {
      internal static let back = ImageAsset(name: "Images/Common/back")
      internal static let loader = ImageAsset(name: "Images/Common/loader")
      internal static let location = ImageAsset(name: "Images/Common/location")
      internal static let search = ImageAsset(name: "Images/Common/search")
    }
    internal enum Weather {
      internal enum Large {
        internal static let rain = ImageAsset(name: "Images/Weather/Large/rain")
        internal static let sun = ImageAsset(name: "Images/Weather/Large/sun")
        internal static let thunder = ImageAsset(name: "Images/Weather/Large/thunder")
      }
      internal enum Small {
        internal static let rain = ImageAsset(name: "Images/Weather/Small/rain")
        internal static let sun = ImageAsset(name: "Images/Weather/Small/sun")
        internal static let thunder = ImageAsset(name: "Images/Weather/Small/thunder")
      }
    }
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
