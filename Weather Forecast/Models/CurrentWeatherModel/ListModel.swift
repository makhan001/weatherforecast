//
//  File.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation

struct ListModel {
    var dt : Int = -1
    var main : MainModel  = MainModel()
    var weather : [WeatherModel] = []
    var clouds : CloudsModel  = CloudsModel()
    var wind : WindModel  = WindModel()
    var sys : SysModel  = SysModel()
    var dt_txt : String = ""
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let dt = response["dt"] as? Int {
            self.dt = dt
        }
        
        if let main = response["main"] as? [String : Any] {
            self.main = MainModel( response : main )
        }
        
        if let weather = response["weather"] as? [[String : Any]] {
            for item in weather {
                let object = WeatherModel( response: item)
                self.weather.append(object)
            }
        }
        
        if let clouds = response["clouds"] as? [String : Any] {
            self.clouds = CloudsModel( response : clouds )
        }
        
        if let wind = response["wind"] as? [String : Any] {
            self.wind = WindModel( response : wind )
        }
        
        if let sys = response["sys"] as? [String : Any] {
            self.sys = SysModel( response : sys )
        }
        
        if let dt_txt = response["dt_txt"] as? String {
            self.dt_txt = dt_txt
        }
        
    }
}
