import Foundation

final class WeatherViewModel: ObservableObject {
    @Published var weatherModel : WeatherModel = .empty
    private let weatherModelMapper: WeatherModelMapper = WeatherModelMapper()
    
    func getWeather(city: String) async{
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=a5ef20ef82976a5c7b933b377c4a7a29&units=metric")!
    
        do{
            async let (data,_) = try await URLSession.shared.data(from: url)
            let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
            DispatchQueue.main.async {
                self.weatherModel = self.weatherModelMapper.mapDataModelToModel(dataModel: dataModel)
            }
        } catch{
            print(error.localizedDescription)
        }
    }
}
