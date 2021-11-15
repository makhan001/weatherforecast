//
//  WhetherForecastViewModel.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation
import Firebase

class WeatherForecastViewModel : NSObject {
    
    var WeatherForecastStatus  : APILoadingStatus = .isLoading
    var weatherData : WeatherForecastModel!
    
    let databaseReference = Database.database().reference()
    
    var latitude: String = ""
    var longitude: String = ""
    
    override init() {
        super.init()
    }
    
    //
    //MARK:- Fatch Current Whether Data API Calling
    //
    
    func FetchWeatherForecastData(success: @escaping () -> Void) {
        var params : [String : Any] = [:]
        params.updateValue(latitude, forKey: "lat")
        params.updateValue(longitude, forKey: "lon")
        params.updateValue("148e14f32dc98e0ed9093c6b2487d0b1", forKey: "appid")
        
        
        self.WeatherForecastStatus = .isLoading
        WebserviceManager.shared.sendRequest(serviceType: .FetchWeatherForecast, params: params) { (response) in
            if let resp = response as? [String : Any] {
                let data = WeatherForecastModel(response: resp)
                self.weatherData = data
                self.sendDataToFirebase()
                success()
            }
            
            self.WeatherForecastStatus = .success
            print("WeatherForecastStatus Success")
            
        } failure: { (error) in
            self.WeatherForecastStatus = .failed(error: .notFound)
            print("WeatherForecastStatus error")
            
        } offline: { (error) in
            print("WeatherForecastStatus network error")
            self.WeatherForecastStatus = .failed(error:.noInternetConnection )
        }
    }
    
    private func sendDataToFirebase() {
        if weatherData != nil {
            for item in weatherData.hourly {
                let timestamp = "\(Int(Date().timeIntervalSince1970))"
                let dictOrder = [
                    "userId": "1",
                    "userName": "Vinod Kumar",
                    "location": "India",
                    "temperature": String(format: "%.1f", item.temp.toCelcius),
                    "whetherImage": "",
                    "whetherTime": item.dt.toTime,
                    "whetherStatus": item.weather.first?.description.capitalized ?? ""
                ] as [String : Any]
                databaseReference.child("user").child("1").child(timestamp).setValue(dictOrder)
            }
        }
    }
}












