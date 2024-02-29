//
//  ContentView.swift
//  SkySeeker
//
//  Created by Agustina Marcos on 29/02/2024.
//

import SwiftUI

struct ContentView: View {
    private let weatherViewModel = WeatherViewModel()
    
    var body: some View {
            Text("Hello, world!")
            .padding()
            .task {
                await weatherViewModel.getWeather(city: "Buenos Aires", API_KEY: "")
                <#code#>
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
