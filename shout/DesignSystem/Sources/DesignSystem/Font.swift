import SwiftUI

public extension Font {
    /// Namespace to prevent naming collisions with static accessors on
    /// SwiftUI's Font.
    ///
    /// Xcode's autocomplete allows for easy discovery of design system fonts.
    /// At any call site that requires a font, type `Font.DesignSystem.<esc>`
    struct DesignSystem {
        public static let title = Font.custom("MidCenturyRegular", size: UIScreen.main.bounds.width * 0.25) //100
		public static let card = Font.custom("MidCenturyRegular", size: UIScreen.main.bounds.width * 0.15) //60
		public static let header = Font.custom("Lato-Bold", size: UIScreen.main.bounds.width * 0.1) //40
        public static let page = Font.custom("MidCenturyRegular", size: UIScreen.main.bounds.width * 0.0825) //33
        public static let bigBody = Font.custom("Lato-Regular", size: UIScreen.main.bounds.width * 0.075) //30
        public static let regularBody = Font.custom("Lato-Regular", size: UIScreen.main.bounds.width * 0.0625) //25
        public static let smallBody = Font.custom("Lato-Regular", size: UIScreen.main.bounds.width * 0.05) //20
        public static let smallLight = Font.custom("Lato-Light", size: UIScreen.main.bounds.width * 0.0375) //15
    }
}
