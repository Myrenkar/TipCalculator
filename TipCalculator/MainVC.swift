//
//  MainVC.swift
//  TipCalculator
//
//  Created by Piotr Torczyski on 09/02/16.
//  Copyright © 2016 Piotr Torczyski. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var subtotalEntry: UITextField!
    
    @IBOutlet weak var numOfPeople: UITextField!
    @IBOutlet weak var percFromSlider: UILabel!
    
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var tipPerPerson: UILabel!
    
    @IBOutlet weak var perPersonText: UILabel!
    @IBOutlet weak var startOverButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipPerPerson.hidden = true
        perPersonText.hidden = true
        startOverButton.hidden = true
        
        subtotalEntry.text = nil
        sliderValue.value = 20
        percFromSlider.text = "20%"
        numOfPeople.text = nil
        tipPerPerson.text = nil
        
        subtotalEntry.delegate = self
        numOfPeople.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sliderChanged(sender: UISlider) {
        //set value for the slider
        
        let currentValue = Int(sliderValue.value)
        percFromSlider.text = "\(currentValue)%"
        
    }
    @IBAction func calculateTipPressed(sender: AnyObject) {
        
        if subtotalEntry.text == nil{
            subtotalEntry.text = "0.00"
        }
        
        if numOfPeople.text == nil {
            numOfPeople.text = "1"
            
        }
        
        let subtotal  = Float(subtotalEntry.text!)
        let split = Float(numOfPeople.text!)
        let percentage = Int(sliderValue.value)
        
        
        //perform calculation
        
        tipPerPerson.text = "$" + String(subtotal! * (Float(percentage)/100) / split!)
        
        tipPerPerson.hidden = false
        perPersonText.hidden = false
        startOverButton.hidden = false
        
        
        subtotalEntry.resignFirstResponder()
        numOfPeople.resignFirstResponder()
        
        
    }
    
    @IBAction func startOverPressed(sender: AnyObject) {
        
        //restore settings
        
        tipPerPerson.hidden = true
        perPersonText.hidden = true
        startOverButton.hidden = true
        
        subtotalEntry.text = nil
        sliderValue.value = 20
        percFromSlider.text = "20%"
        numOfPeople.text = nil
        tipPerPerson.text = nil
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        subtotalEntry.resignFirstResponder()
        numOfPeople.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        subtotalEntry.resignFirstResponder()
        numOfPeople.resignFirstResponder()
    }
    
    

}
