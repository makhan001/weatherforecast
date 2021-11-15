//
//  File2.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation
struct WeatherModel {
    
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
