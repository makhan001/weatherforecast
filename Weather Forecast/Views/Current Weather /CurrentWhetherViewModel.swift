//
//  viewmodel.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import Foundation

class CurrentWhetherViewModel : NSObject {
    
    private var  CurrentWhetherDataStatus  : APILoadingStatus = .isLoading
    var whetherData : CurrentWeatherModel!

    var bindCurrentWhetherViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        
    }
    
    //
    //MARK:- Fatch Current Whether Data API Calling
    //
    
    func FetchCurrentWhetherData() {
        var params : [String : Any] = [:]
        params.updateValue("London,uk", forKey: "q")
        self.CurrentWhetherDataStatus = .isLoading
        WebserviceManager.shared.sendRequest(serviceType: .FetchCurrentWhether, params: params) { (response) in
            //
            // Success callback
            //
            if let resp = response as? [String : Any] {
                let sessionSlotsModel = CurrentWeatherModel(response: resp)
                self.whetherData = sessionSlotsModel
            }
            
            self.CurrentWhetherDataStatus = .success
            print("CurrentWhetherDataStatus Success")
            
        } failure: { (error) in
            self.CurrentWhetherDataStatus = .failed(error: .notFound)
            print("CurrentWhetherDataStatus error")
            
        } offline: { (error) in
            print("CurrentWhetherDataStatus network error")
            self.CurrentWhetherDataStatus = .failed(error:.noInternetConnection )
        }
    }
}

