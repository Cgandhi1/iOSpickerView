//
//  ViewController.swift
//  picker2
//
//  Created by admin on 11/4/18.
//  Copyright © 2018 Chirag Gandhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var countryPicker: UIPickerView!
    
    @IBAction func nextPage(_ sender: Any) {
        performSegue(withIdentifier: "seguepage1to2", sender: self)
        
    }
    
    let country = ["USA", "Canada"]
    var action = 0 //state or province switch, 1 for state, 2 for province
    var countrySelected = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countrySelected = country[0]
        countryPicker.selectRow(action, inComponent: 0, animated: false)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return country.count
    }
        
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return country[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if country[row] == country[0]
        {
            action = 0
            countrySelected = country[0]
        }
        
        if country[row] == country[1]{
            action = 1
            countrySelected = country[1]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var secondController = segue.destination as! ViewTwo
        secondController.action = action
        secondController.countrySelected = countrySelected
    }
    

}

