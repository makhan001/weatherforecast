//
//  File.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation
struct CoordModel {

var lat : Double = -1.0
var lon : Double = -1.0

init() {}

init(response : [String : Any]) {

if let lat = response["lat"] as? Double {
    self.lat = lat
}
 
if let lon = response["lon"] as? Double {
    self.lon = lon
}
 
}
}

