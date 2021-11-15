//
//  HomeViewController.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 12/10/2021.
//

import UIKit
import SDWebImage
import SVProgressHUD
import GooglePlaces

class HomeViewController: UIViewController {
    

    @IBOutlet weak var imgBackgroundImage:UIImageView!
    @IBOutlet weak var collectionView:WeeklyWeatherCollection!
    
    private var viewModel : WeatherForecastViewModel = WeatherForecastViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    @IBAction func autocompleteClicked(_ sender: UIButton) {
        
        let placePickerController = GMSAutocompleteViewController()
        placePickerController.delegate = self
        present(placePickerController, animated: true, completion: nil)
      }
    
}
// MARK: Instance Methods
extension HomeViewController {
    
    private func setup() {
        populateWeatherData()
        self.collectionView.configure(viewModel: self.viewModel)
       // getLocation()
    }
    private func populateWeatherData() {
        self.imgBackgroundImage.sd_setImage(with: URL(string: "https://www.xtrafondos.com/wallpapers/tormenta-electricas-6698.jpg"), placeholderImage: UIImage(named: "clearSky"))
        }
    }



extension HomeViewController: GMSAutocompleteViewControllerDelegate {

  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
    print("Place name: \(place.name ?? "")")
    print("Place address: \(place.formattedAddress  ?? "")")
    print("Place attributions: \(place.attributions)")
    dismiss(animated: true, completion: nil)
  }

  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }

  // User canceled the operation.
  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    dismiss(animated: true, completion: nil)
  }

  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }

  func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }

}
