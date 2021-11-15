//
//  File.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation

struct CloudsModel {
    
    var all : Int = -1
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let all = response["all"] as? Int {
            self.all = all
        }
        
    }
}
