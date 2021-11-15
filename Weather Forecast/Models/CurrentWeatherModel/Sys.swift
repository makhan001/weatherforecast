//
//  File.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation
struct SysModel {
    
    var pod : String = ""
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let pod = response["pod"] as? String {
            self.pod = pod
        }
        
    }
}
