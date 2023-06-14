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
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            VStack(spacing: 30) {
                ColorView(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue)
                ColorSliderView(value: $redSliderValue, sliderValue: $redSliderValue, color: .red)
                ColorSliderView(value: $greenSliderValue, sliderValue: $greenSliderValue, color: .green)
                ColorSliderView(value: $blueSliderValue, sliderValue: $blueSliderValue, color: .blue)
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    @Binding var sliderValue: Double

    let color: Color

    var body: some View {
        HStack {
            Text("\(lround(sliderValue))").foregroundColor(color)
                .frame(width: 50)
            Slider(value: $value, in: 1...255, step: 1).accentColor(color)
            Text("255").foregroundColor(color)
        }
    }
}


