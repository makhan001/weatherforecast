//
//  CurrentWeterModel.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation

struct WeatherForecastModel {
    
    var lat : Double = -1.0
    var lon : Double = -1.0
    var timezone : String = ""
    var timezone_offset : Int = -1
    var current : Current  = Current()
    var minutely : [Minutely] = []
    var hourly : [Hourly] = []
    var daily : [Daily] = []
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let lat = response["lat"] as? Double {
            self.lat = lat
        }
        
        if let lon = response["lon"] as? Double {
            self.lon = lon
        }
        
        if let timezone = response["timezone"] as? String {
            self.timezone = timezone
        }
        
        if let timezone_offset = response["timezone_offset"] as? Int {
            self.timezone_offset = timezone_offset
        }
        
        if let current = response["current"] as? [String : Any] {
            self.current = Current( response : current )
        }
        
        if let minutely = response["minutely"] as? [[String : Any]] {
            for item in minutely {
                let object = Minutely( response: item)
                self.minutely.append(object)
            }
        }
        
        if let hourly = response["hourly"] as? [[String : Any]] {
            for item in hourly {
                let object = Hourly( response: item)
                self.hourly.append(object)
            }
        }
        
        if let daily = response["daily"] as? [[String : Any]] {
            for item in daily {
                let object = Daily( response: item)
                self.daily.append(object)
            }
        }
    }
}



struct Current {
    
    var dt : Int = -1
    var sunrise : Int = -1
    var sunset : Int = -1
    var temp : Double = -1.0
    var feels_like : Double = -1.0
    var pressure : Int = -1
    var humidity : Int = -1
    var dew_point : Double = -1.0
    var uvi : Int = -1
    var clouds : Int = -1
    var visibility : Int = -1
    var wind_speed : Double = -1.0
    var wind_deg : Int = -1
    var weather : [Weather] = []
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let dt = response["dt"] as? Int {
            self.dt = dt
        }
        
        if let sunrise = response["sunrise"] as? Int {
            self.sunrise = sunrise
        }
        
        if let sunset = response["sunset"] as? Int {
            self.sunset = sunset
        }
        
        if let temp = response["temp"] as? Double {
            self.temp = temp
        }
        
        if let feels_like = response["feels_like"] as? Double {
            self.feels_like = feels_like
        }
        
        if let pressure = response["pressure"] as? Int {
            self.pressure = pressure
        }
        
        if let humidity = response["humidity"] as? Int {
            self.humidity = humidity
        }
        
        if let dew_point = response["dew_point"] as? Double {
            self.dew_point = dew_point
        }
        
        if let uvi = response["uvi"] as? Int {
            self.uvi = uvi
        }
        
        if let clouds = response["clouds"] as? Int {
            self.clouds = clouds
        }
        
        if let visibility = response["visibility"] as? Int {
            self.visibility = visibility
        }
        
        if let wind_speed = response["wind_speed"] as? Double {
            self.wind_speed = wind_speed
        }
        
        if let wind_deg = response["wind_deg"] as? Int {
            self.wind_deg = wind_deg
        }
        
        if let weather = response["weather"] as? [[String : Any]] {
            for item in weather {
                let object = Weather( response: item)
                self.weather.append(object)
            }
        }
        
    }
}


struct Daily {
    
    var dt : Int = -1
    var sunrise : Int = -1
    var sunset : Int = -1
    var moonrise : Int = -1
    var moonset : Int = -1
    var moon_phase : Double = -1.0
    var temp : Temp  = Temp()
    var feels_like : Feels_like  = Feels_like()
    var pressure : Int = -1
    var humidity : Int = -1
    var dew_point : Double = -1.0
    var wind_speed : Double = -1.0
    var wind_deg : Int = -1
    var wind_gust : Double = -1.0
    var weather : [Weather] = []
    var clouds : Int = -1
    var pop : Double = -1.0
    var uvi : Double = -1.0
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let dt = response["dt"] as? Int {
            self.dt = dt
        }
        
        if let sunrise = response["sunrise"] as? Int {
            self.sunrise = sunrise
        }
        
        if let sunset = response["sunset"] as? Int {
            self.sunset = sunset
        }
        
        if let moonrise = response["moonrise"] as? Int {
            self.moonrise = moonrise
        }
        
        if let moonset = response["moonset"] as? Int {
            self.moonset = moonset
        }
        
        if let moon_phase = response["moon_phase"] as? Double {
            self.moon_phase = moon_phase
        }
        
        if let temp = response["temp"] as? [String : Any] {
            self.temp = Temp( response : temp )
        }
        
        if let feels_like = response["feels_like"] as? [String : Any] {
            self.feels_like = Feels_like( response : feels_like )
        }
        
        if let pressure = response["pressure"] as? Int {
            self.pressure = pressure
        }
        
        if let humidity = response["humidity"] as? Int {
            self.humidity = humidity
        }
        
        if let dew_point = response["dew_point"] as? Double {
            self.dew_point = dew_point
        }
        
        if let wind_speed = response["wind_speed"] as? Double {
            self.wind_speed = wind_speed
        }
        
        if let wind_deg = response["wind_deg"] as? Int {
            self.wind_deg = wind_deg
        }
        
        if let wind_gust = response["wind_gust"] as? Double {
            self.wind_gust = wind_gust
        }
        
        if let weather = response["weather"] as? [[String : Any]] {
            for item in weather {
                let object = Weather( response: item)
                self.weather.append(object)
            }
        }
        
        if let clouds = response["clouds"] as? Int {
            self.clouds = clouds
        }
        
        if let pop = response["pop"] as? Double {
            self.pop = pop
        }
        
        if let uvi = response["uvi"] as? Double {
            self.uvi = uvi
        }
        
    }
}


struct Feels_like {
    
    var day : Double = -1.0
    var night : Double = -1.0
    var eve : Double = -1.0
    var morn : Double = -1.0
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let day = response["day"] as? Double {
            self.day = day
        }
        
        if let night = response["night"] as? Double {
            self.night = night
        }
        
        if let eve = response["eve"] as? Double {
            self.eve = eve
        }
        
        if let morn = response["morn"] as? Double {
            self.morn = morn
        }
        
    }
}


struct Hourly {
    
    var dt : Int = -1
    var temp : Double = -1.0
    var feels_like : Double = -1.0
    var pressure : Int = -1
    var humidity : Int = -1
    var dew_point : Double = -1.0
    var uvi : Int = -1
    var clouds : Int = -1
    var visibility : Int = -1
    var wind_speed : Double = -1.0
    var wind_deg : Int = -1
    var wind_gust : Double = -1.0
    var weather : [Weather] = []
    var pop : Int = -1
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let dt = response["dt"] as? Int {
            self.dt = dt
        }
        
        if let temp = response["temp"] as? Double {
            self.temp = temp
        }
        
        if let feels_like = response["feels_like"] as? Double {
            self.feels_like = feels_like
        }
        
        if let pressure = response["pressure"] as? Int {
            self.pressure = pressure
        }
        
        if let humidity = response["humidity"] as? Int {
            self.humidity = humidity
        }
        
        if let dew_point = response["dew_point"] as? Double {
            self.dew_point = dew_point
        }
        
        if let uvi = response["uvi"] as? Int {
            self.uvi = uvi
        }
        
        if let clouds = response["clouds"] as? Int {
            self.clouds = clouds
        }
        
        if let visibility = response["visibility"] as? Int {
            self.visibility = visibility
        }
        
        if let wind_speed = response["wind_speed"] as? Double {
            self.wind_speed = wind_speed
        }
        
        if let wind_deg = response["wind_deg"] as? Int {
            self.wind_deg = wind_deg
        }
        
        if let wind_gust = response["wind_gust"] as? Double {
            self.wind_gust = wind_gust
        }
        
        if let weather = response["weather"] as? [[String : Any]] {
            for item in weather {
                let object = Weather( response: item)
                self.weather.append(object)
            }
        }
        
        if let pop = response["pop"] as? Int {
            self.pop = pop
        }
        
    }
}


struct Minutely {
    
    var dt : Int = -1
    var precipitation : Int = -1
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let dt = response["dt"] as? Int {
            self.dt = dt
        }
        
        if let precipitation = response["precipitation"] as? Int {
            self.precipitation = precipitation
        }
        
    }
}


struct Temp {
    
    var day : Double = -1.0
    var min : Double = -1.0
    var max : Double = -1.0
    var night : Double = -1.0
    var eve : Double = -1.0
    var morn : Double = -1.0
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let day = response["day"] as? Double {
            self.day = day
        }
        
        if let min = response["min"] as? Double {
            self.min = min
        }
        
        if let max = response["max"] as? Double {
            self.max = max
        }
        
        if let night = response["night"] as? Double {
            self.night = night
        }
        
        if let eve = response["eve"] as? Double {
            self.eve = eve
        }
        
        if let morn = response["morn"] as? Double {
            self.morn = morn
        }
        
    }
}



struct Weather {
    
    var id : Int = -1
    var main : String = ""
    var description : String = ""
    var icon : String = ""
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let id = response["id"] as? Int {
            self.id = id
        }
        
        if let main = response["main"] as? String {
            self.main = main
        }
        
        if let description = response["description"] as? String {
            self.description = description
        }
        
        if let icon = response["icon"] as? String {
            self.icon = icon
        }
        
    }
}
