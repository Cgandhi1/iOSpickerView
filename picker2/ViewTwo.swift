//
//  ViewTwo.swift
//  picker2
//
//  Created by admin on 11/5/18.
//  Copyright © 2018 Chirag Gandhi. All rights reserved.
//

import Foundation
import UIKit

class ViewTwo : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var stateprovincePicker: UIPickerView!
    
    var state = ["Illinois", "Michigan", "Idaho"]
    var province = ["Alberta", "Ottawa", "British Columbia"]
    var action = Int()
    var countrySelected = String()
    var stateprovinceSelected = String()
    var countrows = Int()
    var titlerows = String()
    var index = 0
    var pushButton = Int()
    
    
    @IBAction func backButton1(_ sender: Any) {
        pushButton = 1
        performSegue(withIdentifier: "seguepage2to1", sender: self)
    }
    
    
    @IBAction func nextPage2(_ sender: Any) {
        pushButton = 3
        performSegue(withIdentifier: "seguepage2to3", sender: self)
        
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        
        if action == 0{
            stateprovincePicker.selectRow(index, inComponent: 0, animated: false)
            stateprovinceSelected = state[0]
            print(stateprovinceSelected)
            
        }
        if action == 1{
            stateprovincePicker.selectRow(index, inComponent: 0, animated: false)
            stateprovinceSelected = province[0]
            print(stateprovinceSelected)
        }
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if action == 0 {
            countrows = state.count
        }
        if action == 1 {
            countrows = province.count
        }
        return countrows
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if action == 0 {
            titlerows = state[row]
        }
        if action == 1 {
            titlerows = province[row]
        }
        return titlerows
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if action == 0 {
            stateprovinceSelected = state[row]
            index = state.firstIndex(of: stateprovinceSelected)!
            print(stateprovinceSelected)
            print(index)
            
        }
        if action == 1 {
            stateprovinceSelected = province[row]
            index = province.firstIndex(of: stateprovinceSelected)!
            print(stateprovinceSelected)
            print(index)
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if pushButton == 1 {
        var firstController = segue.destination as! ViewController
        firstController.action = action
        firstController.countrySelected = countrySelected
        }
        if pushButton == 3 {
        var thirdController = segue.destination as! ViewThree
        thirdController.countrySelected = countrySelected
        thirdController.stateprovinceSelected = stateprovinceSelected
        thirdController.action = action
        thirdController.index = index
    }
    }
    

}
