//
//  PickerViewController.swift
//  MyWeatherAppThree
//
//  Created by Azis Isa on 4/22/19.
//  Copyright © 2019 Azis Isa. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var selectCityLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
   
    
    let cities = ["Bishkek", "Almaty", "Moscow", "Dushanbe", "Tashkent"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        return selectCityLabel.text = cities[row]
    }
   
    var cityText = ""
    
    @IBAction func done(_ sender: Any) {
        cityText = selectCityLabel.text!
        performSegue(withIdentifier: "cityName", sender: self )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! WeatherTableViewController
        vc.cityName = cityText
        print(vc.cityName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


