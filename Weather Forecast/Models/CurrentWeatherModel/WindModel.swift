//
//  File3.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation
struct WindModel {
    
    var speed : Double = -1.0
    var deg : Double = -1.0
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let speed = response["speed"] as? Double {
            self.speed = speed
        }
        
        if let deg = response["deg"] as? Double {
            self.deg = deg
        }
        
    }
}

