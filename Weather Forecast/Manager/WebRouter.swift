//
//  ViewController.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//
import Foundation

enum APILoadingStatus : Equatable{
    case isLoading
    case failed(error : APIError)
    case success
    case none
}

enum APIError : Int {
    case badRequest = 400
    case notFound = 404
    case serverError = 500
    case unAuthorized = 401
    case noInternetConnection 
}

enum API {
    case Main
    var url : String {
        return APIConstants.ConfigUrls.basePath
    }
}
enum Router {
    case CurrentWhether([String:Any])
    case WeatherList([String:Any])
    
    var baseUrl : String {
        switch self {
        case .CurrentWhether(_),
             .WeatherList(_):
            
            return API.Main.url
        }
    }
    
    var path: String {
        switch self {
        
        case .CurrentWhether(_):
            return "weather?"
        case .WeatherList(_):
            return "onecall?"
        }
    }
    
    var finalUrl : String {
        let url = baseUrl + path
        return url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}

