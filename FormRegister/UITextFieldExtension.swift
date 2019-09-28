//
//  UITextFieldExtension.swift
//  FormRegister
//
//  Created by Thaliees on 9/28/19.
//  Copyright © 2019 Thaliees. All rights reserved.
//

import UIKit

extension UITextField {
    func setLeftIcon(image: UIImage, size: Int) {
        let icon = UIImageView(frame: CGRect(x: 5, y: 5, width: size, height: size))
        icon.image = image
        icon.contentMode = .scaleAspectFit
        
        let sizeContainer:Int = size + 10
        let iconContainer:UIView = UIView(frame: CGRect(x: 0, y: 0, width: sizeContainer, height: sizeContainer))
        iconContainer.addSubview(icon)
        leftView = iconContainer
        leftViewMode = .always
    }
    
    func setRightIcon(image: UIImage, size: Int) {
        let icon = UIImageView(frame: CGRect(x: 5, y: 5, width: size, height: size))
        icon.image = image
        icon.contentMode = .scaleAspectFit
        
        let sizeContainer:Int = size + 10
        let iconContainer:UIView = UIView(frame: CGRect(x: 0, y: 0, width: sizeContainer, height: sizeContainer))
        iconContainer.addSubview(icon)
        rightView = iconContainer
        rightViewMode = .always
    }
    
    func isValidEmail() -> Bool {
        let REGEX_EMAIL = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", REGEX_EMAIL)
        return emailPred.evaluate(with: text?.trimmingCharacters(in: .whitespaces))
    }
    
    func isValidPhone() -> Bool {
        let REGEX_PHONE = "^[0-9]{10}$"
        let phonePred = NSPredicate(format: "SELF MATCHES %@", REGEX_PHONE)
        return phonePred.evaluate(with: text?.trimmingCharacters(in: .whitespaces))
    }
}
