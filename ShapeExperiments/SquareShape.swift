//
//  SquareShape.swift
//  ShapeExperiments
//
//  Created by Felix De Montis on 23.03.22.
//

import SwiftUI

struct SquareShape: View {
    let info: SquareShapeInfo
    
    var blurActive: Bool
    
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .background(content: {
                ForEach(info.colors, id: \.color) {circle in
                    Circle()
                        .fill(circle.color)
                        .frame(width: circle.radius * 2, height: circle.radius * 2, alignment: .center)
                        .position(x: circle.x, y: circle.y)
                }
            })
            .frame(width: 100, height: 100, alignment: .center)
            .blur(radius: blurActive ? info.blurRadius : 0)
            .clipped()
            .cornerRadius(20)
            
    }
}

struct SquareShape_Previews: PreviewProvider {
    static var previews: some View {
        SquareShape(info: SquareShapeInfo.oe3Example, blurActive: true)
    }
}

struct SquareShapeInfo {
    var blurRadius: CGFloat = 10
    
    var colors: [SquareShapeInfoColor]
    
    struct SquareShapeInfoColor {
        var x: CGFloat
        var y: CGFloat
        var radius: CGFloat
        
        var color: Color
    }
}

extension SquareShapeInfo {
    static var oe3Example: SquareShapeInfo {
        SquareShapeInfo(blurRadius: 10, colors: [
            .init(x: 30,  y: 30,  radius: 60,  color: Color(hex: "#ff0054")),
            .init(x: 0,   y: 90,  radius: 50,  color: Color(hex: "#02029f")),
            .init(x: 110, y: 80,  radius: 50,  color: Color(hex: "#ce176d")),
            .init(x: 50,  y: 160, radius: 90,  color: Color(hex: "#3b1d3e")),
            .init(x: 140, y: -40, radius: 100, color: Color(hex: "#8939d9")),
            .init(x: 120, y: -20, radius: 50,  color: Color(hex: "#0211ec"))
        ])
    }
}

// https://stackoverflow.com/a/56874327/2046802
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
