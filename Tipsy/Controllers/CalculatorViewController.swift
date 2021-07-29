//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctbutton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipAmount = 0.0
    var finalAmount = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctbutton.isSelected = false
        sender.isSelected = true
        billTextField.endEditing(true)
        let tipTitle = sender.currentTitle!.dropLast()
        tipAmount = Double(tipTitle)! / 100
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalBillAmount = Double(billTextField.text!)!
        let splitNumber = Double(splitNumberLabel.text!)!
        let amount = totalBillAmount * (1 + tipAmount) / splitNumber
        finalAmount = String(format: "%.2f", amount)
        print(finalAmount)
        
        performSegue(withIdentifier: "presentResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total = finalAmount
            destinationVC.numberOfPeople = Int(splitNumberLabel.text!)
            destinationVC.tipPercentage = Int(tipAmount * 100)
        }
    }
}

