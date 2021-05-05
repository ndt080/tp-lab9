import SwiftUI

struct Weather: Codable, Identifiable{
    struct coord: Codable {
        var lon: Double
        var lat: Double
    }
    struct weather {
        var id : UUID
        var main: String
        var description: String
        var ico: UUID
    }
    var base: String
    struct main {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    struct wind {
        var speed: Double
        var deg: Double
    }
    struct clouds {
        var all: Int
    }
    var dt: Int
    struct sys {
        var type: Int
        var id: Int
        var message: Double
        var country: String
        var sunrise: Int
        var sunset: Int
        
    }
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}
