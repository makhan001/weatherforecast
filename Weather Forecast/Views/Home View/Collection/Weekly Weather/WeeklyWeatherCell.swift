//
//  WeeklyWeatherCell.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 12/10/2021.
//

import UIKit
import SDWebImage
class WeeklyWeatherCell: UICollectionViewCell {
    @IBOutlet weak var lblDay:UILabel!
    @IBOutlet weak var lblDate:UILabel!
    @IBOutlet weak var lblCloudType:UILabel!
    @IBOutlet weak var imgWeatherType:UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    func configure(_ item: Hourly) {
//        self.lblDay.text = item.dt.toTime
//        self.lblDate.text = item.weather.first?.description.capitalized ?? ""
//       // self.lblTemperature.text = String(format: "%.1f", item.temp.toCelcius) + " C°"
//        if let icon = item.weather.first?.icon {
//            let url = "https://openweathermap.org/img/w/" + "\(icon)" + ".png"
//            self.imgWeatherType.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "Clouds"))
//        }
//    }
}
