import SwiftUI

class Api {
    func getWeather(completion: @escaping (Weather) -> ()){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&units=metric&appid=2c896e6c8b5868fe924ede075a5a2b65") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            let weatherData = try! JSONDecoder().decode(Weather.self, from: data!)
            DispatchQueue.main.async {
                completion(weatherData)
                print(weatherData)
            }
        }.resume()
    }
    func getWeatherArray(completion: @escaping ([Weather]) -> ()){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&units=metric&appid=2c896e6c8b5868fe924ede075a5a2b65") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            let weatherData = try! JSONDecoder().decode([Weather].self, from: data!)
            DispatchQueue.main.async {
                completion(weatherData)
                print(weatherData)
            }
        }.resume()
    }
}

