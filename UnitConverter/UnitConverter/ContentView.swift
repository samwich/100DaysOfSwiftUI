//
//  ContentView.swift
//  UnitConverter
//
//  Created by Sam Johnson on 2022-11-06.
//

import SwiftUI

struct ContentView: View {

    enum TemperatureScale: String, CaseIterable, Identifiable {
        case kelvin
        case celsius
        case fahrenheit

        var id: String {
            self.rawValue
        }
    }
    
    @State private var inputDegrees = 0.0
    @State private var inputScaleSelection = TemperatureScale.celsius
    @State private var outputScaleSelection = TemperatureScale.fahrenheit
    @FocusState private var inputIsFocused: Bool

//    let scales = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var outputDegrees: Double {
        var kelvinDegrees: Double
        
        switch inputScaleSelection {
        case .celsius:
            kelvinDegrees = inputDegrees + 273.15
        case .kelvin:
            kelvinDegrees = inputDegrees
        case .fahrenheit:
            kelvinDegrees = (inputDegrees - 32) * (5/9) + 273.15
        }
        
        switch outputScaleSelection {
        case .celsius:
            return kelvinDegrees - 273.15
        case .kelvin:
            return kelvinDegrees
        case .fahrenheit:
            return (kelvinDegrees - 273.15) * (9/5) + 32
        }
    }
    var outputFormatted: String {
        return "\(outputDegrees)° \(outputScaleSelection)"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter degrees", value: $inputDegrees, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text("Enter degrees")
                }
                Section {
                    Picker("Input unit", selection: $inputScaleSelection) {
                        ForEach(TemperatureScale.allCases, id: \.self) { item in
                            Text(item.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input unit")
                }
                Section {
                    Picker("Output unit", selection: $outputScaleSelection) {
                        ForEach(TemperatureScale.allCases, id: \.self) { item in
                            Text(item.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output unit")
                }
                Section {
                    Text(outputFormatted)
                } header: {
                    Text("Answer")
                }
            }
            .navigationTitle("Temperature Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
