import SwiftUI

class Api {
    func getWeather(lat: Double, lon: Double, completion: @escaping (WeatherData) -> ()){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat="+String(lat)+"&lon="+String(lon)+"&units=metric&appid=2c896e6c8b5868fe924ede075a5a2b65") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let weatherData = try! JSONDecoder().decode(WeatherData.self, from: data!)
            DispatchQueue.main.async {
                completion(weatherData)
                print(weatherData)
            }
        }.resume()
    }
    
    func getWeatherArray(completion: @escaping ([WeatherData]) -> ()){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&units=metric&appid=2c896e6c8b5868fe924ede075a5a2b65") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            let weatherData = try! JSONDecoder().decode([WeatherData].self, from: data!)
            DispatchQueue.main.async {
                completion(weatherData)
                print(weatherData)
            }
        }.resume()
    }
}

