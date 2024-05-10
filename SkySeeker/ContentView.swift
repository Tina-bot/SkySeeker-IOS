    import SwiftUI

    struct ContentView: View {
        @StateObject var weatherViewModel = WeatherViewModel()
        
        var body: some View {
            ZStack{
                VStack{
                    Text(weatherViewModel.weatherModel.city)
                        .foregroundColor(.white)
                        .font(.system(size: 70))
                        .padding(.top, 10)
                    Text(weatherViewModel.weatherModel.description)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom, 8)
                    HStack {
                        if let iconURL = weatherViewModel.weatherModel.iconURL,
                           let url = URL(string: "http://openweathermap.org/img/wn/\(iconURL)@2x.png"){
                            AsyncImage(url: url){ image in
                                image
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        Text(weatherViewModel.weatherModel.currentTemperature)
                            .font(.system(size: 70))
                            .foregroundColor(.white)
                    }
                    .padding(.top, -20)
                    HStack(spacing: 14){
                        Label(weatherViewModel.weatherModel.maxTemperature, systemImage: "thermometer.sun.fill")
                        Label(weatherViewModel.weatherModel.minTemperature, systemImage: "thermometer.snowflake")
                    }
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
                    .padding(.bottom, 2)
                    Label(weatherViewModel.weatherModel.humidity, systemImage: "humidity.fill")
                        .symbolRenderingMode(.multicolor)
                        .foregroundColor(.white)
                    Spacer()
                    AsyncImage(url: URL(string: "https://www.textures4photoshop.com/tex/thumbs/free-clouds-sky-overlay-png-for-photoshop-thumb41.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding(.bottom, 20)
                }
            }
            .background(
                LinearGradient(colors: [.purple,.white], startPoint: .topLeading, endPoint: .bottomLeading))
            .task {
                await weatherViewModel.getWeather(city: "London");
                }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
