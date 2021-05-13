import SwiftUI

struct WeatherData: Codable, Identifiable{
    var coord: Coord
    var weather: [Weather]
    var base: String
    var main: Main
    var wind: Wind
    var clouds: Clouds
    var dt: Int
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
    
    struct Coord: Codable {
        var lon: Double
        var lat: Double
    }
    
    struct Weather: Codable {
        var id : Int
        var main: String
        var description: String
        //    var ico: String
    }
    
    struct Wind: Codable {
        var speed: Double
        var deg: Double
    }
    
    struct Clouds: Codable {
        var all: Int
    }
    
    struct Main: Codable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
}


