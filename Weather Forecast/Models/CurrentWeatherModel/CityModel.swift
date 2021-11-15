//
//  city.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation
struct CityModel {
    
    var id : Int = -1
    var name : String = ""
    var coord : CoordModel  = CoordModel()
    var country : String = ""
    var population : Int = -1
    var timezone : Int = -1
    var sunrise : Int = -1
    var sunset : Int = -1
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let id = response["id"] as? Int {
            self.id = id
        }
        
        if let name = response["name"] as? String {
            self.name = name
        }
        
        if let coord = response["coord"] as? [String : Any] {
            self.coord = CoordModel( response : coord )
        }
        
        if let country = response["country"] as? String {
            self.country = country
        }
        
        if let population = response["population"] as? Int {
            self.population = population
        }
        
        if let timezone = response["timezone"] as? Int {
            self.timezone = timezone
        }
        
        if let sunrise = response["sunrise"] as? Int {
            self.sunrise = sunrise
        }
        
        if let sunset = response["sunset"] as? Int {
            self.sunset = sunset
        }
        
    }
}
