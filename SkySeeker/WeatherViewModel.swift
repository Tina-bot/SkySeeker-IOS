//
//  WeatherViewModel.swift
//  SkySeeker
//
//  Created by Agustina Marcos on 29/02/2024.
//

import Foundation

final class WeatherViewModel {
    func getWeather(city: String, API_KEY: String) async{
        let url = URL(string: "  https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(api_key)&units=metric&lang=es")
    
        do{
            async let (data,_) = try await URLSession.shared.data(from: url)
            let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
            print(dataModel)
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
