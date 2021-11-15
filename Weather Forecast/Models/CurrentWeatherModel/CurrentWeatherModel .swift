//
//  File.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation

struct CurrentWeatherModel {
    
    var coord : CoordModel = CoordModel()
    var weather : [WeatherModel] = []
    var base : String = ""
    var main : MainModel  = MainModel()
    var visibility : Int = -1
    var wind : WindModel  = WindModel()
    var clouds : CloudsModel  = CloudsModel()
    var dt : Int = -1
    var sys : SysModel  = SysModel()
    var timezone : Int = -1
    var id : Int = -1
    var name : String = ""
    var cod : Int = -1
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let coord = response["coord"] as? [String : Any] {
            self.coord = CoordModel( response : coord )
        }
        
        if let weather = response["weather"] as? [[String : Any]] {
            for item in weather {
                let object = WeatherModel( response: item)
                self.weather.append(object)
            }
        }
        
        if let base = response["base"] as? String {
            self.base = base
        }
        
        if let main = response["main"] as? [String : Any] {
            self.main = MainModel( response : main )
        }
        
        if let visibility = response["visibility"] as? Int {
            self.visibility = visibility
        }
        
        if let wind = response["wind"] as? [String : Any] {
            self.wind = WindModel( response : wind )
        }
        
        if let clouds = response["clouds"] as? [String : Any] {
            self.clouds = CloudsModel( response : clouds )
        }
        
        if let dt = response["dt"] as? Int {
            self.dt = dt
        }
        
        if let sys = response["sys"] as? [String : Any] {
            self.sys = SysModel( response : sys )
        }
        
        if let timezone = response["timezone"] as? Int {
            self.timezone = timezone
        }
        
        if let id = response["id"] as? Int {
            self.id = id
        }
        
        if let name = response["name"] as? String {
            self.name = name
        }
        
        if let cod = response["cod"] as? Int {
            self.cod = cod
        }
        
    }
}

