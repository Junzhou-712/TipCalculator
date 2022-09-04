//
//  ViewController.swift
//  prework-proj
//
//  Created by 苏俊州 on 2022/9/3.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextfield: UITextField!
    @IBOutlet weak var totalAmountLable: UILabel!
    @IBOutlet weak var tipAmountLable: UILabel!
    @IBOutlet weak var tipControlSlide: UISlider!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipAmountControl(_ sender: Any) {
        let bill = Double(billAmountTextfield.text!) ?? 0
        //Get tip amount by selecting three segments
        let tipPercentage = [0.15, 0.18, 0.2]
        let tip = tipPercentage[tipControl.selectedSegmentIndex] * bill
        tipControlSlide.value = Float(tipPercentage[tipControl.selectedSegmentIndex] * 100)
        let total = bill + tip
        //Update Tip Amount Lable
        tipAmountLable.text = String(format: "$%.2f", tip)
        //Update Total Amount Lable
        totalAmountLable.text = String(format: "$%.2f", total)
    }
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount from text field input
        let bill = Double(billAmountTextfield.text!) ?? 0
        //Get total tip by multiplying tip * tipPercentage
        
        let tipProgress = Double(tipControlSlide.value) ?? 0
        let tip = bill * (tipProgress / 100)
        let total = bill + tip
        //Update Tip Amount Lable
        tipAmountLable.text = String(format: "$%.2f", tip)
        //Update Total Amount Lable
        totalAmountLable.text = String(format: "$%.2f", total)
    }
}

