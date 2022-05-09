import SwiftUI

public extension Color {
    /// Namespace to prevent naming collisions with static accessors on
    /// SwiftUI's Color.
    ///
    /// Xcode's autocomplete allows for easy discovery of design system colors.
    /// At any call site that requires a color, type `Color.DesignSystem.<esc>`
    struct DesignSystem {
        public static let background = Color(red: 0.8078431487083435, green: 0.8980392217636108, blue: 0.8156862854957581, opacity: 1)
		public static let backgroundDark = Color(red: 0.36862745098, green: 0.46666666666, blue: 0.37647058823, opacity: 1)
        public static let secondary = Color(red: 0.9529411792755127, green: 0.9411764740943909, blue: 0.843137264251709, opacity: 1)
        public static let primary = Color(red: 0.9098039269447327, green: 0.6078431606292725, blue: 0.40392157435417175, opacity: 1)
        public static let body = Color(red: 0, green: 0, blue: 0, opacity: 1)
        public static let symbol1 = Color(red: 0.3612152636051178, green: 0.5633565187454224, blue: 0.8416666388511658, opacity: 1)
        public static let symbol2 = Color(red: 0.5792708396911621, green: 0.8374999761581421, blue: 0.6268393993377686, opacity: 1)
        public static let symbol3 = Color(red: 0.9833333492279053, green: 0.9164119958877563, blue: 0.5531250238418579, opacity: 1)
        public static let symbol4 = Color(red: 0.2408333271741867, green: 0.28333333134651184, blue: 0.2620833218097687, opacity: 1)
        public static let symbol5 = Color(red: 0.8500000238418579, green: 0.5892296433448792, blue: 0.3329166769981384, opacity: 1)
        public static let symbol6 = Color(red: 0.7416666746139526, green: 0.386284738779068, blue: 0.42273426055908203, opacity: 1)
        public static let white = Color(red: 1, green: 1, blue: 1, opacity: 1)
        public static let symbol7 = Color(red: 0.6749999523162842, green: 0.852272629737854, blue: 0.8999999761581421, opacity: 1)
        public static let symbol8 = Color(red: 0.652946412563324, green: 0.6187152862548828, blue: 0.8583333492279053, opacity: 1)
    }
}

