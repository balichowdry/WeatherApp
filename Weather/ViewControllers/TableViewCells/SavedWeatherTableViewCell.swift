//
//  WeakWeatherTableViewCell.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.
//

import UIKit

class SavedWeatherTableViewCell: UITableViewCell {
    
    static let identifier = "SavedWeatherCell"
    
    @IBOutlet weak var week: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var humid: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with vm: SavedWeatherDayRepresentable) {
//        date.text = vm.date
//        temp.text = vm.temp
//        humid.text = vm.humidity
        
    }
}
