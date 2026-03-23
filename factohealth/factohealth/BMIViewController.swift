//
//  BMIViewController.swift
//  factohealth
//
//  Created by Nishanth S Shastry on 26/02/25.
//

import UIKit

class BMIViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightSegment: UISegmentedControl!
    @IBOutlet weak var heightSegment: UISegmentedControl!
    
    @IBOutlet weak var bmiResult: UILabel!
    
    @IBOutlet weak var resultTypeText: UILabel!
    
    @IBOutlet weak var resultDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegates for the text fields
        weightTextField.delegate = self
        heightTextField.delegate = self
        
        // Add gesture recognizer to dismiss keyboard on tap outside
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        weightTextField.becomeFirstResponder() // Show keyboard automatically for weight field
    }
    
    // Open keyboard when the text field is tapped (this is automatic, but we ensure it)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder() // Ensures keyboard appears
    }
    
    // Dismiss keyboard when tapping anywhere outside the text fields
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        guard let weightText = weightTextField.text, let heightText = heightTextField.text,
              let weight = Double(weightText), let height = Double(heightText) else {
            bmiResult.text = "0"
            resultTypeText.text = "Invalid Input"
            resultDescription.text = "Please enter valid numbers"
            return
        }
        
        var weightInKg = weight
        var heightInMeters = height
        
        // Convert weight to kg if lbs is selected
        if weightSegment.selectedSegmentIndex == 1 {
            weightInKg = weight * 0.453592
        }
        
        // Convert height to meters if inches is selected
        if heightSegment.selectedSegmentIndex == 1 {
            heightInMeters = height * 0.0254
        }
        
        // BMI Calculation
        let bmi = weightInKg / (heightInMeters * heightInMeters)
        bmiResult.text = String(format: "%.1f", bmi)
        
        // BMI Result Description
        switch bmi {
        case 0..<18.5:
            resultTypeText.text = "Underweight"
            resultDescription.text = "You are underweight. A balanced diet can help improve your health."
        case 18.5..<24.9:
            resultTypeText.text = "Normal Weight"
            resultDescription.text = "Great job! You have a healthy weight."
        case 25..<29.9:
            resultTypeText.text = "Overweight"
            resultDescription.text = "You are overweight. Regular exercise and a healthy diet are recommended."
        case 30...:
            resultTypeText.text = "Obese"
            resultDescription.text = "Obesity detected. Please consult a healthcare professional."
        default:
            resultTypeText.text = "Invalid BMI"
            resultDescription.text = "Check your inputs."
        }
    }
    
    @IBAction func clearFields(_ sender: UIButton) {
        weightTextField.text = ""
        heightTextField.text = ""
        bmiResult.text = "0"
        resultTypeText.text = "No Result"
        resultDescription.text = "N/A"
    }
}
