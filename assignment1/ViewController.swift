//
//  ViewController.swift
//  Assignment 1
//
//  Created by Rajat Sachdeva on 2024-09-20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var unitSwitch: UISwitch!
    
    @IBOutlet weak var height1Text: UITextField!
    
    @IBOutlet weak var height2Text: UITextField!
    
    @IBOutlet weak var weightText: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unitAction(_ sender: Any) {
        if unitSwitch.isOn {
            height1Text.placeholder = "centimeters"
            height2Text.isHidden = true
            weightText.placeholder = "kilograms"
        } else {
            height1Text.placeholder = "feets"
            height2Text.isHidden = false
            weightText.placeholder = "pounds"
        }
    }
    @IBAction func height1Action(_ sender: Any) {
    }
    @IBAction func height2Action(_ sender: Any) {
    }
    @IBAction func weightAction(_ sender: Any) {
    }
    @IBAction func calculateAction(_ sender: Any) {
        var height: Double?
        var weight: Double?
        var bmi: Double? = 0.0
        if unitSwitch.isOn {
            if let height1 = height1Text.text, let weight1 = weightText.text {
                if !height1.isEmpty && !weight1.isEmpty {
                    height = Double(height1)! / 100
                    weight = Double(weight1)
                    bmi = weight! / (height! * height!)
                    resultLabel.text = String(format: "%.2f", bmi!)
                    print(height!, weight!, bmi!)
                }
            }
        } else {
            if let height1 = height1Text.text, let height2 = height2Text.text, let weight1 = weightText.text {
                if !height1.isEmpty && !height2.isEmpty && !weight1.isEmpty {
                    height = (Double(height1)! * 12) + Double(height2)!
                    weight = Double(weight1)
                    bmi = (weight! * 703) / (height! * height!)
                    resultLabel.text = String(format: "%.2f", bmi!)
                    print(height!, weight!, bmi!)
                }
            }
        }
        categoryLabel.isHidden = false
        if bmi! > 0.0 && bmi! < 100.0 {
            switch bmi! {
                case ..<18.5:
                categoryLabel.textColor = UIColor.red
                categoryLabel.text = "You are underweight. It's important to maintain a healthy diet to gain weight :("
                case 18.5..<24.9:
                categoryLabel.textColor = UIColor.green
                categoryLabel.text = "You have a normal weight. Great job maintaining a healthy balance :)"
                case 25.0..<29.9:
                categoryLabel.textColor = UIColor.orange
                categoryLabel.text = "You are overweight. Consider adopting a healthy lifestyle to manage your weight :|"
                case 30.0...:
                categoryLabel.textColor = UIColor.red
                categoryLabel.text = "You are in the obesity category. It's important to consult a healthcare provider for guidance on managing your health :("
                default:
                categoryLabel.textColor = UIColor.red
                categoryLabel.text = "Invalid BMI value. Please double check your inputs :/"
            }
        } else {
            categoryLabel.textColor = UIColor.red
            categoryLabel.text = "Invalid BMI value. Please double check your inputs :/"
        }
    }
    
}
