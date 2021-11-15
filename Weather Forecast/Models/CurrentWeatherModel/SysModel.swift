//
//  File.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation

struct SysModel {
    var pod : String = ""
    var type : Int = -1
    var id : Int = -1
    var country : String = ""
    var sunrise : Int = -1
    var sunset : Int = -1
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let type = response["type"] as? Int {
            self.type = type
        }
        
        if let id = response["id"] as? Int {
            self.id = id
        }
        
        if let country = response["country"] as? String {
            self.country = country
        }
        
        if let sunrise = response["sunrise"] as? Int {
            self.sunrise = sunrise
        }
        
        if let sunset = response["sunset"] as? Int {
            self.sunset = sunset
        }
        if let pod = response["pod"] as? String {
            self.pod = pod
        }
        
    }
}
