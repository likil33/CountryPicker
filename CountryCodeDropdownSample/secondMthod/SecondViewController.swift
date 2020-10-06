//
//  SecondViewController.swift
//  CountryCodeDropdownSample
//
//  Created by santhosh on 11/12/18.
//  Copyright © 2018 nb. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var numbertextField: UITextField!
    
    @IBOutlet weak var phoneCodeBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func countryBtn(_ sender: UIButton) {
        let picker = MICountryPicker { (name, code) -> () in
            print(code)
        }
        picker.didSelectCountryWithCallingCodeClosure = { name, code, dialCode in
            print(dialCode)
            self.phoneCodeBtn.setTitle("\(dialCode)", for: .normal)
        }
        
        // Optional: To pick from custom countries list
        // picker.customCountriesCode = ["EG", "US", "AF", "AQ", "AX"]
        
        // delegate
        picker.delegate = self
        
        // Display calling codes
        //        picker.showCallingCodes = true
        
        // or closure
        picker.didSelectCountryClosure = { name, code in
            picker.navigationController?.popToRootViewController(animated: true)
            print(code)
        }
        navigationController?.pushViewController(picker, animated: true)
        
        
    }
    

}
extension SecondViewController: MICountryPickerDelegate {
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String) {
        picker.navigationController?.popToRootViewController(animated: true)
       print("Selected Country: \(name) : \(code)")
    }
}
