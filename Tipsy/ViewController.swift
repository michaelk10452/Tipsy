//
//  ViewController.swift
//  Prework
//
//  Created by Michael Kurdahi on 12/24/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var tipTotalLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var perPersonBillLabel: UILabel!
    @IBOutlet weak var splitTipLabel: UILabel!
    @IBOutlet weak var splitTotalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tipSlider.value = (self.tipSlider.maximumValue / 10);
    }
    @IBAction func sliderValueChanged(_ sender: Any) {
        tipLabel.text = String(format: "Tip %%: %2d", Int(tipSlider.value))
    }
    @IBAction func splitValueChanged(_ sender: Any) {
        let currentSplit = Int(splitSlider.value)
        splitLabel.text = "Split: \(currentSplit)"
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        
        //Get location and local currency
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        //Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        //Get tip percentaged and calculate total
        let tipPercentage = Double(Int(tipSlider.value)) / 100
        print(tipPercentage)
        
        let tip = (bill * tipPercentage)
        let total = bill + tip
                
        //Split the tip
        let splitNumber = Double(Int(splitSlider.value))
        
        let per_person_bill = bill / splitNumber
        let splitTip = tip / splitNumber
        let split = total / splitNumber
        
        
        //Update the tip, total, split tip & split total labels
        let new_total = String(format: "%.2f",total)
        totalLabel.text = "\(currencySymbol)\(new_total)"
        let new_split = String(format: "%.2f",split)
        splitTotalLabel.text = "\(currencySymbol)\(new_split)"
        let new_splitTip = String(format: "%.2f",splitTip)
        splitTipLabel.text = "Tip: \(currencySymbol)\(new_splitTip)"
        let new_tip = String(format: "%.2f",tip)
        tipTotalLabel.text = "Tip: \(currencySymbol)\(new_tip)"
        let new_bill = String(format: "%.2f",bill)
        totalBillLabel.text = "Bill: \(currencySymbol)\(new_bill)"
        let new_per_person_bill = String(format: "%.2f",per_person_bill)
        perPersonBillLabel.text = "Bill: \(currencySymbol)\(new_per_person_bill)"
    }
}

