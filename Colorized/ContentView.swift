//
//  ContentView.swift
//  Colorized
//
//  Created by Alexey Kanaev on 6/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 1...255)
    @State private var greenSliderValue = Double.random(in: 1...255)
    @State private var blueSliderValue = Double.random(in: 1...255)

    var body: some View {
        VStack {
            Text("\(lround(redSliderValue))")
            ColorSliderView(value: $redSliderValue, color: .red)
            ColorSliderView(value: $greenSliderValue, color: .green)
            ColorSliderView(value: $blueSliderValue, color: .blue)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    @Binding var value: Double

    let color: Color

    var body: some View {
        HStack {
            Text("0").foregroundColor(color)
            Slider(value: $value, in: 1...255, step: 1).accentColor(color)
            Text("255").foregroundColor(color)
        }
    }
}
