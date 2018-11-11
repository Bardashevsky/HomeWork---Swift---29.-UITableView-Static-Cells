//
//  OBTableViewController.swift
//  HomeWork - Swift - 29. UITableView Static Cells
//
//  Created by Oleksandr Bardashevskyi on 11/9/18.
//  Copyright © 2018 Oleksandr Bardashevskyi. All rights reserved.
//

import UIKit

class OBTableViewController: UITableViewController {
    
    enum OperationsWithMemories : Int {
        case Save = 1
        case Clear = 2
        case Load = 3
    }
    enum CollectionSlider : Int{
        case Height = 0
        case Weight = 1
    }
    
    enum CollectionTextFields : Int {
        case LogPass = 1
        case FirstLastName = 3
        case Age = 4
        case PhoneNumber = 5
        case Email = 6
    }

    @IBOutlet var outletCollectionTextFields: [UITextField]!
    @IBOutlet var outletCollectionLabels: [UILabel]!
    @IBOutlet var outletCollectionSlider: [UISlider]!

    
    
    @IBOutlet weak var outletGenderSwitch: UISwitch!
    
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    //MARK: - Keys for Labels userDefault
    let kLoginLabel         = "Login"
    let kPasswordLabel      = "Password"
    let kFirstNameLabel     = "FirstName"
    let kLastNameLabel      = "LastName"
    let kAgeLabel           = "Age"
    let kPhoneNumberlabel   = "PhoneNumber"
    let kEmailLabel         = "Email"
    
    let kLoginTextField         = "LoginTextField"
    let kPasswordTextField      = "PasswordTextField"
    let kFirstNameTextField     = "FirstNameTextField"
    let kLastNameTextField      = "LastNameTextField"
    let kAgeTextField           = "AgeTextField"
    let kPhoneNumberTextField   = "PhoneNumberTextField"
    let kEmailTextField         = "EmailTextField"
    
    
    let kGenderLabel        = "Gender"
    let kHeightLabel        = "Height"
    let kLweightLabel       = "Weight"
    
    let kSlider0 = "kSlider0Height"
    let kSlider1 = "kSlider1Weight"
    let kGenderSwitch = "kGenderSwitch"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.heightLabel.layer.borderWidth = 1
        self.heightLabel.layer.cornerRadius = 15
        self.heightLabel.layer.borderColor = self.heightLabel.tintColor.cgColor
        self.weightLabel.layer.borderWidth = 1
        self.weightLabel.layer.cornerRadius = 15
        self.weightLabel.layer.borderColor = self.heightLabel.tintColor.cgColor
        for i in self.outletCollectionTextFields {
            i.keyboardAppearance = UIKeyboardAppearance.dark
        }
        for i in self.outletCollectionLabels {
            i.layer.masksToBounds = true
            i.layer.cornerRadius = i.frame.height/5
            i.layer.borderWidth = 1
            i.layer.borderColor = self.heightLabel.tintColor.cgColor
        }
        loadSettings()
    }
    //MARK: - userDefaults
    func saveSettings() {
        let userDefaults = UserDefaults.standard
        
        let keysArrayTextField = [self.kLoginTextField, self.kPasswordTextField, self.kFirstNameTextField, self.kLastNameTextField, self.kAgeTextField, self.kPhoneNumberTextField, self.kEmailTextField]
        
        for i in 0..<self.outletCollectionTextFields.count {
            userDefaults.set(self.outletCollectionTextFields[i].text, forKey: keysArrayTextField[i])
        }
        
        userDefaults.set(self.outletCollectionLabels[0].text, forKey: kLoginLabel)
        userDefaults.set(self.outletCollectionLabels[1].text, forKey: kPasswordLabel)
        userDefaults.set(self.outletCollectionLabels[2].text, forKey: kFirstNameLabel)
        userDefaults.set(self.outletCollectionLabels[3].text, forKey: kLastNameLabel)
        userDefaults.set(self.outletCollectionLabels[4].text, forKey: kAgeLabel)
        userDefaults.set(self.outletCollectionLabels[5].text, forKey: kPhoneNumberlabel)
        userDefaults.set(self.outletCollectionLabels[6].text, forKey: kEmailLabel)
        
        userDefaults.set(self.genderLabel.text, forKey: kGenderLabel)
        userDefaults.set(self.heightLabel.text, forKey: kHeightLabel)
        userDefaults.set(self.weightLabel.text, forKey: kLweightLabel)
        
        userDefaults.set(self.outletCollectionSlider[CollectionSlider.Height.rawValue].value, forKey: kSlider0)
        userDefaults.set(self.outletCollectionSlider[CollectionSlider.Weight.rawValue].value, forKey: kSlider1)
        userDefaults.set(self.outletGenderSwitch.isOn, forKey: kGenderSwitch)
        userDefaults.synchronize()
    }
    func loadSettings() {
        let userDefaults = UserDefaults.standard
        
        let keysArrayTextField = [self.kLoginTextField, self.kPasswordTextField, self.kFirstNameTextField, self.kLastNameTextField, self.kAgeTextField, self.kPhoneNumberTextField, self.kEmailTextField]
        
        for i in 0..<self.outletCollectionTextFields.count {
            self.outletCollectionTextFields[i].text = userDefaults.object(forKey: keysArrayTextField[i]) as? String ?? ""
        }
        
        self.outletCollectionLabels[0].text = userDefaults.object(forKey: kLoginLabel) as? String ?? ""
        self.outletCollectionLabels[1].text = userDefaults.object(forKey: kPasswordLabel) as? String ?? ""
        self.outletCollectionLabels[2].text = userDefaults.object(forKey: kFirstNameLabel) as? String ?? ""
        self.outletCollectionLabels[3].text = userDefaults.object(forKey: kLastNameLabel) as? String ?? ""
        self.outletCollectionLabels[4].text = userDefaults.object(forKey: kAgeLabel) as? String ?? ""
        self.outletCollectionLabels[5].text = userDefaults.object(forKey: kPhoneNumberlabel) as? String ?? ""
        self.outletCollectionLabels[6].text = userDefaults.object(forKey: kEmailLabel) as? String ?? ""
        
        self.genderLabel.text = userDefaults.object(forKey: kGenderLabel) as? String ?? "Male / Female"
        self.heightLabel.text = userDefaults.object(forKey: kHeightLabel) as? String ?? "0"
        self.weightLabel.text = userDefaults.object(forKey: kLweightLabel) as? String ?? "0"
        
        self.outletCollectionSlider[CollectionSlider.Height.rawValue].value = userDefaults.object(forKey: kSlider0) as? Float ?? 0
        self.outletCollectionSlider[CollectionSlider.Weight.rawValue].value = userDefaults.object(forKey: kSlider1) as? Float ?? 0
        self.outletGenderSwitch.isOn = userDefaults.object(forKey: kGenderSwitch) as? Bool ?? false
    }
    //MARK: - Actions
    @IBAction func actionsTextFields(_ sender: UITextField) {
        saveSettings()
    }
    @IBAction func actionGenderSwitch(_ sender: UISwitch) {
        if sender.isOn {
            self.genderLabel.text = "Male"
        } else {
            self.genderLabel.text = "Female"
        }
    }
    @IBAction func actionHeightSlider(_ sender: UISlider) {
        self.heightLabel.text = String(Int(sender.value))
    }
    @IBAction func actionWeightSlider(_ sender: UISlider) {
        self.weightLabel.text = String(Int(sender.value))
    }
    @IBAction func actionOperationsWithMemories(_ sender: UIButton) {
        if sender.tag == OperationsWithMemories.Save.rawValue {
            saveSettings()
        } else if sender.tag == OperationsWithMemories.Clear.rawValue {
            for i in self.outletCollectionLabels {
                i.text = ""
            }
            for i in self.outletCollectionTextFields {
                i.text = ""
            }
            self.genderLabel.text = "Male/Female"
            self.heightLabel.text = "0"
            self.weightLabel.text = "0"
            self.outletCollectionSlider[CollectionSlider.Height.rawValue].value = 0
            self.outletCollectionSlider[CollectionSlider.Weight.rawValue].value = 0
            self.outletGenderSwitch.isOn = false
        } else if sender.tag == OperationsWithMemories.Load.rawValue {
            loadSettings()
        }
    }
}
//MARK: - Delegate for format UITextField
extension OBTableViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let str = (textField.text ?? "") as NSString
        let newString = String(str.replacingCharacters(in: range, with: string))
        for i in 0..<self.outletCollectionTextFields.count {
            if self.outletCollectionTextFields[i].isEqual(textField) {
                switch i {
                case let count where count <= CollectionTextFields.LogPass.rawValue:
                    return optimizationSettings(count: 16, newString: newString, string: string, characterSet: CharacterSet.alphanumerics.inverted, outletCollectionLabels: &self.outletCollectionLabels[i].text!)
                case let count where count > CollectionTextFields.LogPass.rawValue && count <= CollectionTextFields.FirstLastName.rawValue:
                    return optimizationSettings(count: 16, newString: newString, string: string, characterSet: CharacterSet.letters.inverted, outletCollectionLabels: &self.outletCollectionLabels[i].text!)
                case let count where count == CollectionTextFields.Age.rawValue :
                    return optimizationSettings(count: 3, newString: newString, string: string, characterSet: CharacterSet.decimalDigits.inverted, outletCollectionLabels: &self.outletCollectionLabels[i].text!)
                case let count where count == CollectionTextFields.PhoneNumber.rawValue:
                    return optimizationSettings(count: 12, newString: newString, string: string, characterSet: CharacterSet.decimalDigits.inverted, outletCollectionLabels: &self.outletCollectionLabels[i].text!)
                case let count where count == CollectionTextFields.Email.rawValue:
                    self.outletCollectionLabels[i].text! = newString
                    return newString.count <= 30
                default: break
                }
            }
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        for i in 0..<self.outletCollectionTextFields.count {
            if self.outletCollectionTextFields[i].isEqual(textField) {
                return i < self.outletCollectionTextFields.count - 1 ? self.outletCollectionTextFields[i + 1].becomeFirstResponder() : self.outletCollectionTextFields[i].resignFirstResponder()
            }
        }
        
        return true
    }
    //MARK: - Optimizations and format
    func phoneNumberFormat (string: String) -> String {
        var str = string
        if str.count == 12 || str.count == 13 {
            let index0 = str.index(str.startIndex,offsetBy: 0)
            str.insert("+", at: index0)
            
            let index1 = str.index(str.startIndex,offsetBy: 3)
            str.insert("(", at: index1)
            
            let index2 = str.index(str.startIndex,offsetBy: 7)
            str.insert(")", at: index2)
            
            let index3 = str.index(str.startIndex, offsetBy: 11)
            str.insert("-", at: index3)
            
            let index4 = str.index(str.startIndex, offsetBy: 14)
            str.insert("-", at: index4)
        }
        return str
    }
    
    func optimizationSettings(count: Int, newString: String, string: String, characterSet: CharacterSet, outletCollectionLabels: inout String) -> Bool{
        if newString.count <= count {
            if string.components(separatedBy: characterSet).count > 1  {
                return false
            }
            outletCollectionLabels = count == 12 ? phoneNumberFormat(string: newString) : newString
        }
        return newString.count <= count
    }
}
