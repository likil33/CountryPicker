//
//  ViewController.swift
//  CountryCodeDropdownSample
//
//  Created by santhosh on 11/12/18.
//  Copyright © 2018 nb. All rights reserved.
//

import UIKit
import FlagPhoneNumber


class ViewController: UIViewController {
    @IBOutlet weak var phoneNumberTF: FPNTextField!
    var phoneCode = String()
    
    var phoneNumberTextField: FPNTextField!
    override func viewDidLoad() {
       // phoneNumberTextField = FPNTextField(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 16, height: 50))
        phoneNumberTextField = phoneNumberTF
        
        // You can change the chosen flag then set the phone number
        phoneNumberTextField.setFlag(for: .IN)
        phoneNumberTextField.set(phoneNumber: "+91")

        // Or directly set the phone number with country code, which will update automatically the flag image
        phoneNumberTextField.set(phoneNumber: "+91")
        
        // Comment this line to not have access to the country list
        phoneNumberTextField.parentViewController = self
        phoneNumberTextField.flagPhoneNumberDelegate = self
        phoneNumberTextField.hasPhoneNumberExample = false
        phoneNumberTextField.placeholder = "0123456789"
        // Custom the size/edgeInsets of the flag button
        phoneNumberTextField.flagSize = CGSize(width: 35, height: 35)
        phoneNumberTextField.flagButtonEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        view.addSubview(phoneNumberTextField)
        
        phoneNumberTextField.center = view.center
        
        
        
        print(self.phoneNumberTextField.text as Any)
    }
 

    private func getCustomTextFieldInputAccessoryView(with items: [UIBarButtonItem]) -> UIToolbar {
        let toolbar: UIToolbar = UIToolbar()
        
        toolbar.barStyle = UIBarStyle.default
        toolbar.items = items
        toolbar.sizeToFit()
        
        return toolbar
    }
    
    
    @IBAction func BtnAction(_ sender: UIButton) {
        guard let text = self.phoneNumberTextField.text else {return}
        let code1 = phoneCode + text
        print(code1)
    }
    
}

extension ViewController: FPNTextFieldDelegate {
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        textField.rightViewMode = .always
        //textField.rightView = UIImageView(image: isValid ? #imageLiteral(resourceName: "success") : #imageLiteral(resourceName: "error"))
        
        print(
            isValid,
            textField.getFormattedPhoneNumber(format: .E164) ?? "",
            textField.getFormattedPhoneNumber(format: .International) ?? "",
            textField.getFormattedPhoneNumber(format: .National) ?? "",
            textField.getFormattedPhoneNumber(format: .RFC3966) ?? "",
            textField.getRawPhoneNumber() ?? ""
        )
    }
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
        phoneCode = dialCode
    }
}
