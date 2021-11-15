//
//  WeeklyWeatherCollection.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 12/10/2021.
//

import Foundation
import UIKit

class WeeklyWeatherCollection: UICollectionView {
    
    var viewModel: WeatherForecastViewModel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: WeatherForecastViewModel) {
        let nib = UINib(nibName: "WeeklyWeatherCell", bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: "WeeklyWeatherCell")
        self.delegate = self
        self.dataSource = self
        self.viewModel = viewModel
        reloadData()
    }
}

extension WeeklyWeatherCollection: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeeklyWeatherCell", for: indexPath) as? WeeklyWeatherCell else {
            return UICollectionViewCell()
        }
        //cell.configure(viewModel.weatherData.hourly[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
