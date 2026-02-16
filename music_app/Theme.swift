import SwiftUI

struct AppTheme {
    static let primary = Color(red: 0.98, green: 0.45, blue: 0.08) // Bright Orange
    static let secondary = Color(red: 0.95, green: 0.20, blue: 0.20) // Vibrant Red
    static let background = Color(red: 0.05, green: 0.05, blue: 0.06)
    static let surface = Color(red: 0.12, green: 0.12, blue: 0.14)
    
    static let gradient = LinearGradient(
        colors: [primary, secondary],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct GlassModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Blur(style: .systemUltraThinMaterialDark))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
            )
    }
}

extension View {
    func glassStyle() -> some View {
        self.modifier(GlassModifier())
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
