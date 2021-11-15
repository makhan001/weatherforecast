//
//  WebserviceManager.swift
//
//  ViewController.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation
import Alamofire

enum ServiceType {
    
    case FetchCurrentWhether
    case FetchWeatherForecast
    
}
typealias ServiceRequestSuccessBlock  = (_ result:Any) -> Void
typealias ServiceRequestFailureBlock  = (_ failurError:NSError) -> Void
typealias ServiceRequestOfflineBlock  = (_ offline:NSError) -> Void


class WebserviceManager : NSObject {
    static var shared = WebserviceManager()
    weak var alamofireManager : AlamofireManager? = AlamofireManager.shared
    private override init() {
        super.init()
    }
    
    func sendRequest(serviceType : ServiceType,
                     params : [String : Any],
                     success: @escaping ServiceRequestSuccessBlock,
                     failure: @escaping ServiceRequestFailureBlock,
                     offline: @escaping ServiceRequestOfflineBlock){
        
        // Provision for custom tokens
        let accessToken = ""
        print("SERVICE TYPE IS - \(serviceType)")
        
        switch serviceType {
        
        case .FetchCurrentWhether:
            fetchCurrentWhether(accessToken: accessToken, serviceType: serviceType, params: params, success: success, failure: failure, offline: offline)
        
        case .FetchWeatherForecast:
            fetchWeatherForecast(accessToken: accessToken, serviceType: serviceType, params: params, success: success, failure: failure, offline: offline)
            
        }
    }
    
    private func fetchCurrentWhether(accessToken : String, serviceType : ServiceType, params: [String : Any], success: @escaping ServiceRequestSuccessBlock, failure: @escaping ServiceRequestFailureBlock, offline: @escaping ServiceRequestOfflineBlock) {
        
        let headers : [String : String] = getGenericHeaders()
        let url = Router.CurrentWhether(params).finalUrl
        let httpHeaders = HTTPHeaders.init(headers)
        print("requestParams------->>>>>,\(params)")
        print("url------->>>>>,\(url)")
        
        //
        // Returning a mock response
        //
        
//        let notificationData = Utils.fetchDataFromLocalJson(name: "CurrentWeather") as! [String : Any]
//        success(notificationData)
//        print("localJSON notificationData \(notificationData)")
//        return;
        
        alamofireManager?.makeAPIRequest(urlRequest: url, parameters: params, methodType: .get, encodingType: URLEncoding.default, headers: httpHeaders, success: { (response) in
            success(response)
            
        }) { (error) in
            failure(error as NSError)
        }
    }
    
    private func fetchWeatherForecast(accessToken : String, serviceType : ServiceType, params: [String : Any], success: @escaping ServiceRequestSuccessBlock, failure: @escaping ServiceRequestFailureBlock, offline: @escaping ServiceRequestOfflineBlock) {
        
        let headers : [String : String] = getGenericHeaders()
        let url = Router.WeatherList(params).finalUrl
        let httpHeaders = HTTPHeaders.init(headers)
        print("requestParams------->>>>>,\(params)")
        print("url------->>>>>,\(url)")
      
        
//        let weatherData = Utils.fetchDataFromLocalJson(name: "WeatherForecast") as! [String : Any]
//        success(weatherData)
//        print("localJSON notificationData \(weatherData)")
//        return;
        alamofireManager?.makeAPIRequest(urlRequest: url, parameters: params, methodType: .get, encodingType: URLEncoding.default, headers: httpHeaders, success: { (response) in
            success(response)
            
        }) { (error) in
            failure(error as NSError)
        }
    }
}



// MARK:- Utils Extensions
extension WebserviceManager {
    
    func getGenericHeaders() -> [String : String] {
        let headers : [String : String] = [ "x-rapidapi-host": APIConstants.ConfigUrls.rapidapiHost,
                                            "x-rapidapi-key": APIConstants.ConfigUrls.rapidapiKey]
        return headers
    }
}

