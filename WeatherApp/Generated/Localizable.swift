// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localizations {

  internal enum Common {
    /// Отменить
    internal static let cancel = Localizations.tr("Localizable", "Common.cancel")
    /// °
    internal static let celsius = Localizations.tr("Localizable", "Common.celsius")
    /// ,
    internal static let comma = Localizations.tr("Localizable", "Common.comma")
    /// Подтвердить
    internal static let confirm = Localizations.tr("Localizable", "Common.confirm")
    /// 
    internal static let empty = Localizations.tr("Localizable", "Common.empty")
    ///  
    internal static let space = Localizations.tr("Localizable", "Common.space")
    /// Сегодня
    internal static let today = Localizations.tr("Localizable", "Common.today")
  }

  internal enum CurrenWeatherTableViewCell {
    /// ощущается как
    internal static let feelsLike = Localizations.tr("Localizable", "CurrenWeatherTableViewCell.feelsLike")
  }

  internal enum WeatherConditions {
    /// атмосферные явления
    internal static let atmosphere = Localizations.tr("Localizable", "WeatherConditions.atmosphere")
    /// ясно
    internal static let clear = Localizations.tr("Localizable", "WeatherConditions.clear")
    /// облачно
    internal static let clouds = Localizations.tr("Localizable", "WeatherConditions.clouds")
    /// морось
    internal static let drizzle = Localizations.tr("Localizable", "WeatherConditions.drizzle")
    /// дождь
    internal static let rain = Localizations.tr("Localizable", "WeatherConditions.rain")
    /// снег
    internal static let snow = Localizations.tr("Localizable", "WeatherConditions.snow")
    /// гроза
    internal static let thunderstorm = Localizations.tr("Localizable", "WeatherConditions.thunderstorm")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localizations {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
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
