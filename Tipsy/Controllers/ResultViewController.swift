//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Decagon on 28/07/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: String?
    var tipPercentage: Int?
    var numberOfPeople: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tipPercentage!)% tip"
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
