    import SwiftUI

    struct ContentView: View {
        private let weatherViewModel = WeatherViewModel()
        
        var body: some View {
            ZStack{
                VStack{
                    Text("London")
                        .foregroundColor(.white)
                        .font(.system(size: 70))
                    Text("Cuddle")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom, 8)
                    HStack {
                        Text("8°")
                            .font(.system(size: 70))
                            .foregroundColor(.white)
                    }
                    .padding(.top, -20)
                    HStack(spacing: 14){
                        Label("7°", systemImage: "thermometer.sun.fill")
                        Label("4°", systemImage: "thermometer.snowflake")
                    }
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
                    
                }
                Text("Hello, world!")
                    .padding()
            }
            .background(
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomLeading))
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
