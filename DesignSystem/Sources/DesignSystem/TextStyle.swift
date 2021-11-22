import SwiftUI

public struct TextStyle {
    public init(
        color: Color,
        size: FontSize,
        weight: FontWeight = .regular
    ) {
        font = Font.custom(weight.fontName, size: CGFloat(size.rawValue))
        self.color = color
        lineSpacing = CGFloat(size.lineSpacing)
    }

    let font: Font
    let color: Color
    let lineSpacing: CGFloat
}

public extension View {
    func textStyle(
        _ color: Color,
        size: FontSize,
        weight: FontWeight = .regular
    ) -> some View {
        textStyle(
            TextStyle(
                color: color,
                size: size,
                weight: weight
            )
        )
    }
}

public extension View {
    func textStyle(_ textStyle: TextStyle) -> some View {
        font(textStyle.font)
            .foregroundColor(textStyle.color)
            .lineSpacing(textStyle.lineSpacing)
            .padding(.vertical, textStyle.lineSpacing / 2)
    }
}
