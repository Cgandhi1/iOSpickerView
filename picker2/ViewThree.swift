//
//  ViewThree.swift
//  picker2
//
//  Created by admin on 11/5/18.
//  Copyright © 2018 Chirag Gandhi. All rights reserved.
//

import Foundation
import UIKit

class ViewThree : UIViewController{
    
    var countrySelected = String()
    var stateprovinceSelected = String()
    var action = Int()
    var index = Int()
    
    
    
    @IBAction func backButton2(_ sender: Any) {
        performSegue(withIdentifier: "seguepage3to2", sender: self)
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        print("Retreiving data for \(countrySelected) and \(stateprovinceSelected)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var secondController = segue.destination as! ViewTwo
        secondController.action = action
        secondController.index = index
        secondController.countrySelected = countrySelected
    }
    
    
    
}

