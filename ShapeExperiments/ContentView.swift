//
//  ContentView.swift
//  ShapeExperiments
//
//  Created by Felix De Montis on 23.03.22.
//

import SwiftUI

struct ContentView: View {
    
    @State var customColors = [
        Color.red,
        Color.blue,
        Color(hex: "#ffc0cb"), // Web pink
        Color.yellow,
        Color.orange,
        Color.purple
    ]
    
    @State var oe3Blur: Bool = true
    @State var customBlur: Bool = true
        
    var customShapeInfo: SquareShapeInfo {
        SquareShapeInfo(blurRadius: 10, colors: [
            .init(x: 30,  y: 30,  radius: 60,  color: customColors[0]),
            .init(x: 0,   y: 90,  radius: 50,  color: customColors[1]),
            .init(x: 110, y: 80,  radius: 50,  color: customColors[2]),
            .init(x: 50,  y: 160, radius: 90,  color: customColors[3]),
            .init(x: 140, y: -40, radius: 100, color: customColors[4]),
            .init(x: 120, y: -20, radius: 50,  color: customColors[5])
        ])
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text("Custom")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                Spacer()
                
                Toggle("Blur \(customBlur ? "deaktiviern" : "aktivieren")", isOn: $customBlur)
                    .padding(.horizontal)
                    .foregroundColor(Color.black)
            }
            
            HStack(alignment: .top, spacing: 20) {
                SquareShape(info: customShapeInfo, blurActive: customBlur)
                ColorList(colors: customColors)
                VStack(spacing: 0) {
                    ColorPicker("", selection: $customColors[0], supportsOpacity: false)
                        .labelsHidden()
                        .frame(height: 25)
                    ColorPicker("", selection: $customColors[1], supportsOpacity: false)
                        .labelsHidden()
                        .frame(height: 25)
                    ColorPicker("", selection: $customColors[2], supportsOpacity: false)
                        .labelsHidden()
                        .frame(height: 25)
                    ColorPicker("", selection: $customColors[3], supportsOpacity: false)
                        .labelsHidden()
                        .frame(height: 25)
                    ColorPicker("", selection: $customColors[4], supportsOpacity: false)
                        .labelsHidden()
                        .frame(height: 25)
                    ColorPicker("", selection: $customColors[5], supportsOpacity: false)
                        .labelsHidden()
                        .frame(height: 25)
                }
            }
            
            HStack(alignment: .center) {
                Text("Ö3")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                Spacer()
                
                Toggle("Blur \(oe3Blur ? "deaktiviern" : "aktivieren")", isOn: $oe3Blur)
                    .padding(.horizontal)
                    .foregroundColor(Color.black)
            }
            
            HStack(alignment: .top, spacing: 20) {
                SquareShape(info: SquareShapeInfo.oe3Example, blurActive: oe3Blur)
                ColorList(colors: SquareShapeInfo.oe3Example.colors.map { $0.color })
            }
            
            Spacer()
                .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color(hex: "#ccc"))
    }
}

struct ColorList: View {
    let colors: [Color]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(colors.enumerated()), id: \.element) { index, color in
                HStack(spacing: 0) {
                    Text("\(index).")
                        .foregroundColor(Color.black)
                        .frame(width: 20)
                    
                    Rectangle()
                        .fill(color)
                        .frame(maxWidth: 70, idealHeight: .infinity)
                }
                    .frame(maxHeight: 25)
                    .background(Color.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
