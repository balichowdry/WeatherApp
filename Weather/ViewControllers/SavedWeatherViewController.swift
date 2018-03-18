
//  SavedWeatherViewController.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.
//

import UIKit
import RealmSwift
import Realm

class SavedWeatherViewController: WeatherViewController {
    
    var weather = [Weather].init()
    var viewModel: SavedWeatherViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateView()
            }
        }
    }
    
    @IBOutlet weak var savedWeatherTableView: UITableView!
    
    func updateView() {
        activityIndicatorView.stopAnimating()
        
        if let _ = viewModel {
            updateContainerView()
        }
        else {
            //            loadingFailedLabel.isHidden = false
            //            loadingFailedLabel.text = "fetch weather/location failed."
        }
    }
    
    func updateContainerView() {
        weatherContainerView.isHidden = false
        savedWeatherTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
    }
}

extension SavedWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let _ = viewModel else {
            return 0.0
        }
        
        return 104.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let vm = viewModel else {
            return 0
        }
        
        return vm.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = viewModel else {
            return 0
        }
        
        return vm.numberOfDays
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SavedWeatherTableViewCell.identifier, for: indexPath) as? SavedWeatherTableViewCell
        
        guard let row = cell else {
            fatalError("Unexpected table view cell.")
        }
        
        if let vm = viewModel?.viewModel(for: indexPath.row) {
            cell?.configure(with: vm as! SavedWeatherDayRepresentable)
        }
        
        return row
    }
    // saved funciton
    @IBAction func saveDB() {
        let realm = try! Realm()
        
        try! realm.write {
            realm.deleteAll()
            for kind in self.weather {
                realm.add(kind)
            }
        }
        print(Realm.Configuration.defaultConfiguration.fileURL ?? "Empty URL"
)
    }
}

