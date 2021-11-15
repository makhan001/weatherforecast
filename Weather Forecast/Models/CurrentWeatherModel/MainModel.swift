//
//  File.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation

struct MainModel {
    var temp : Double = -1.0
    var temp_min : Double = -1.0
    var temp_max : Double = -1.0
    var pressure : Double = -1.0
    var sea_level : Double = -1.0
    var grnd_level : Double = -1.0
    var humidity : Int = -1
    var temp_kf : String = ""
    var feels_like : Double = -1.0
  
    init() {}
    
    init(response : [String : Any]) {
        
        if let temp = response["temp"] as? Double {
            self.temp = temp
        }
        
        if let temp_min = response["temp_min"] as? Double {
            self.temp_min = temp_min
        }
        
        if let temp_max = response["temp_max"] as? Double {
            self.temp_max = temp_max
        }
        
        if let pressure = response["pressure"] as? Double {
            self.pressure = pressure
        }
        
        if let sea_level = response["sea_level"] as? Double {
            self.sea_level = sea_level
        }
        
        if let grnd_level = response["grnd_level"] as? Double {
            self.grnd_level = grnd_level
        }
        
        if let humidity = response["humidity"] as? Int {
            self.humidity = humidity
        }
        
        if let temp_kf = response["temp_kf"] as? String {
            self.temp_kf = temp_kf
        }
        
        if let feels_like = response["feels_like"] as? Double {
            self.feels_like = feels_like
        }
      
    }
}
