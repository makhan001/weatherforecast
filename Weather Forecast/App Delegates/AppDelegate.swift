//
//  AppDelegate.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import UIKit
import SVProgressHUD
import Firebase
import GooglePlaces
import GoogleMaps


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
      static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
      }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUps()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate{
    func setUps(){
        //
        //MARK:- Firebase SetUp
        //
        FirebaseApp.configure()
        
        //
        //MARK:- ProgressHUD Setup
        //
        SVProgressHUD.setForegroundColor(UIColor.gray)
        SVProgressHUD.setRingThickness(6.0)
        
        
       // GMSServices.provideAPIKey(APIKey)
        GMSPlacesClient.provideAPIKey("AIzaSyADaSsV2o41wJMP4gkhXrphc90xgE0WbpY")
    }
}
