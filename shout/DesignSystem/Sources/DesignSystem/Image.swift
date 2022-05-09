import Foundation
import SwiftUI

public extension Image {
    /// Namespace to prevent naming collisions with static accessors on
    /// SwiftUI's Image.
    ///
    /// Xcode's autocomplete allows for easy discovery of design system images.
    /// At any call site that requires an image, type `Image.DesignSystem.<esc>`
    struct DesignSystem {
        public static let arrow1 = loadImageFromBundle(name: "arrow1")
        public static let arrow4 = loadImageFromBundle(name: "arrow4")
        public static let arrow2 = loadImageFromBundle(name: "arrow2")
        public static let arrow6 = loadImageFromBundle(name: "arrow6")
        public static let arrow5 = loadImageFromBundle(name: "arrow5")
        public static let arrow3 = loadImageFromBundle(name: "arrow3")
        public static let arrow7 = loadImageFromBundle(name: "arrow7")
        public static let blob1 = loadImageFromBundle(name: "blob1")
        public static let blob3 = loadImageFromBundle(name: "blob3")
        public static let blob6 = loadImageFromBundle(name: "blob6")
        public static let blob2 = loadImageFromBundle(name: "blob2")
        public static let blob5 = loadImageFromBundle(name: "blob5")
        public static let blob4 = loadImageFromBundle(name: "blob4")
        public static let blob7 = loadImageFromBundle(name: "blob7")
        public static let diamond1 = loadImageFromBundle(name: "diamond1")
        public static let diamond5 = loadImageFromBundle(name: "diamond5")
        public static let diamond3 = loadImageFromBundle(name: "diamond3")
        public static let diamond2 = loadImageFromBundle(name: "diamond2")
        public static let diamond6 = loadImageFromBundle(name: "diamond6")
        public static let diamond4 = loadImageFromBundle(name: "diamond4")
        public static let diamond7 = loadImageFromBundle(name: "diamond7")
        public static let bowl4 = loadImageFromBundle(name: "bowl4")
        public static let bowl2 = loadImageFromBundle(name: "bowl2")
        public static let bowl6 = loadImageFromBundle(name: "bowl6")
        public static let bowl1 = loadImageFromBundle(name: "bowl1")
        public static let bowl5 = loadImageFromBundle(name: "bowl5")
        public static let bowl3 = loadImageFromBundle(name: "bowl3")
        public static let bowl7 = loadImageFromBundle(name: "bowl7")
        public static let hourglass1 = loadImageFromBundle(name: "hourglass1")
        public static let hourglass4 = loadImageFromBundle(name: "hourglass4")
        public static let hourglass6 = loadImageFromBundle(name: "hourglass6")
        public static let hourglass2 = loadImageFromBundle(name: "hourglass2")
        public static let hourglass5 = loadImageFromBundle(name: "hourglass5")
        public static let hourglass3 = loadImageFromBundle(name: "hourglass3")
        public static let hourglass7 = loadImageFromBundle(name: "hourglass7")
        public static let star1 = loadImageFromBundle(name: "star1")
        public static let star5 = loadImageFromBundle(name: "star5")
        public static let star3 = loadImageFromBundle(name: "star3")
        public static let star6 = loadImageFromBundle(name: "star6")
        public static let star2 = loadImageFromBundle(name: "star2")
        public static let star4 = loadImageFromBundle(name: "star4")
        public static let star7 = loadImageFromBundle(name: "star7")
        public static let circle1 = loadImageFromBundle(name: "circle1")
        public static let circle4 = loadImageFromBundle(name: "circle4")
        public static let circle3 = loadImageFromBundle(name: "circle3")
        public static let circle6 = loadImageFromBundle(name: "circle6")
        public static let circle2 = loadImageFromBundle(name: "circle2")
        public static let circle5 = loadImageFromBundle(name: "circle5")
        public static let circle7 = loadImageFromBundle(name: "circle7")
        public static let pointy1 = loadImageFromBundle(name: "pointy1")
        public static let pointy5 = loadImageFromBundle(name: "pointy5")
        public static let pointy3 = loadImageFromBundle(name: "pointy3")
        public static let pointy7 = loadImageFromBundle(name: "pointy7")
        public static let pointy2 = loadImageFromBundle(name: "pointy2")
        public static let pointy6 = loadImageFromBundle(name: "pointy6")
        public static let pointy4 = loadImageFromBundle(name: "pointy4")
        public static let arrowBase = loadImageFromBundle(name: "arrowBase")
        public static let blobBase = loadImageFromBundle(name: "blobBase")
        public static let diamondBase = loadImageFromBundle(name: "diamondBase")
        public static let bowlBase = loadImageFromBundle(name: "bowlBase")
        public static let hourglassBase = loadImageFromBundle(name: "hourglassBase")
        public static let starBase = loadImageFromBundle(name: "starBase")
        public static let circleBase = loadImageFromBundle(name: "circleBase")
        public static let pointyBase = loadImageFromBundle(name: "pointyBase")
		public static let arrowBaseGray = loadImageFromBundle(name: "arrowBaseGray")
		public static let blobBaseGray = loadImageFromBundle(name: "blobBaseGray")
		public static let diamondBaseGray = loadImageFromBundle(name: "diamondBaseGray")
		public static let bowlBaseGray = loadImageFromBundle(name: "bowlBaseGray")
		public static let hourglassBaseGray = loadImageFromBundle(name: "hourglassBaseGray")
		public static let starBaseGray = loadImageFromBundle(name: "starBaseGray")
		public static let circleBaseGray = loadImageFromBundle(name: "circleBaseGray")
		public static let pointyBaseGray = loadImageFromBundle(name: "pointyBaseGray")
        public static let decks = loadImageFromBundle(name: "decks")
        public static let bg = loadImageFromBundle(name: "bg")
		public static let bg2 = loadImageFromBundle(name: "bg2")
		public static let next = loadImageFromBundle(name: "next")
		public static let bgDark = loadImageFromBundle(name: "bgDark")
        public static let logo = loadImageFromBundle(name: "logo")
		public static let cardBack = loadImageFromBundle(name: "cardBack")
		public static let play = loadImageFromBundle(name: "play")
		public static let settings = loadImageFromBundle(name: "settings")
		public static let stats = loadImageFromBundle(name: "stats")
		public static let packs = loadImageFromBundle(name: "packs")
		public static let howTo = loadImageFromBundle(name: "howTo")
		public static let rightArrow = loadImageFromBundle(name: "rightArrow")
		public static let leftArrow = loadImageFromBundle(name: "leftArrow")
		public static let page1 = loadImageFromBundle(name: "one")
		public static let page2 = loadImageFromBundle(name: "two")
		public static let page3 = loadImageFromBundle(name: "three")
		public static let page4 = loadImageFromBundle(name: "four")
		public static let page5 = loadImageFromBundle(name: "five")
		public static let chip = loadImageFromBundle(name: "chip")
		public static let cardSmall = loadImageFromBundle(name: "cardSmall")
		public static let playSmall = loadImageFromBundle(name: "playSmall")
		public static let diamond1Small = loadImageFromBundle(name: "diamond1Small")
		public static let hourglass4Small = loadImageFromBundle(name: "hourglass4Small")
		public static let howToTitle = loadImageFromBundle(name: "howToTitle")
		public static let settingsTitle = loadImageFromBundle(name: "settingsTitle")
		public static let newDeckTitle = loadImageFromBundle(name: "newDeckTitle")
		public static let statsTitle = loadImageFromBundle(name: "statsTitle")
		public static let packsTitle = loadImageFromBundle(name: "packsTitle")
		public static let buyCard = loadImageFromBundle(name: "buyCard")
		public static let left = loadImageFromBundle(name: "left")
		public static let right = loadImageFromBundle(name: "right")
		public static let x = loadImageFromBundle(name: "x")
		public static let swap = loadImageFromBundle(name: "swap")
		public static let pause = loadImageFromBundle(name: "pause")
        public static let spePlaceholder = loadImageFromBundle(name: "spePlaceholder")
    }
}


/// Loads an image from the DesignSystem module. The image is assumed to be in
/// pdf format.
///
/// - Parameter name: The name of the image to load
/// - Returns: If the named image is found in the DesignSystem module, it is
///            returned. Otherwise, a questionmark image is returned as a
///            placeholder.
private func loadImageFromBundle(name: String) -> Image {
    guard let pdfURL = Bundle.module.url(forResource: name, withExtension: "pdf"),
          let pdfImage = pdfImage(fromURL: pdfURL)
    else { return Image(systemName: "questionmark.square") }
    return Image(uiImage: pdfImage).renderingMode(.original)
}

/// Given a URL to a pdf on disk, returns a rendered UIImage of the pdf.
///
/// - Parameter fromURL: The URL that the pdf resides at
/// - Returns: A UIImage representation of the PDF
///
/// [Implementation source](https://www.hackingwithswift.com/example-code/core-graphics/how-to-render-a-pdf-to-an-image)
private func pdfImage(fromURL url: URL) -> UIImage? {
    guard let document = CGPDFDocument(url as CFURL) else { return nil }
    guard let page = document.page(at: 1) else { return nil }

    let pageRect = page.getBoxRect(.mediaBox)
    let renderer = UIGraphicsImageRenderer(size: pageRect.size)
    let image = renderer.image { context in
        context.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
        context.cgContext.scaleBy(x: 1.0, y: -1.0)
        context.cgContext.drawPDFPage(page)
    }

    return image
}
