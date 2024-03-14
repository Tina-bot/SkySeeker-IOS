import Foundation

final class WeatherViewModel: ObservableObject {
    @Published var weatherResponseDataModel: WeatherResponseDataModel?
    
    func getWeather(city: String) async{
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=a5ef20ef82976a5c7b933b377c4a7a29&units=metric&lang=es")!
    
        do{
            async let (data,_) = try await URLSession.shared.data(from: url)
            let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
            DispatchQueue.main.async {
                self.weatherResponseDataModel = dataModel
            }
        } catch{
            print(error.localizedDescription)
        }
    }
}
