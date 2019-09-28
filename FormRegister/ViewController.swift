//
//  ViewController.swift
//  FormRegister
//
//  Created by Thaliees on 9/28/19.
//  Copyright © 2019 Thaliees. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        email.delegate = self
        phone.delegate = self
        password.delegate = self
        
        email.setLeftIcon(image: UIImage(named: "email")!, size: 15)
        phone.setLeftIcon(image: UIImage(named: "phone")!, size: 15)
        password.setLeftIcon(image: UIImage(named: "password")!, size: 15)
        password.setRightIcon(image: UIImage(named: "see_password")!, size: 15)
        
        email.addLineBottom(width: 0.5)
        phone.addLineBottom(width: 0.5)
        password.addLineBottom(width: 0.5)
    }

    @IBAction func handleSeePassword(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let locationX = sender.location(in: sender.view).x
            let seePassword:UITextField = sender.view as! UITextField
            if locationX >= seePassword.frame.width - 25 {
                seePassword.isSecureTextEntry = !seePassword.isSecureTextEntry
            }
            else { sender.view!.becomeFirstResponder() }
        }
    }
    
    @IBAction func validateAction(_ sender: UIButton) {
        if validateForm() {
            showAlert(title: "Success", message: "OK")
        }
    }
    
    private func validateForm() -> Bool{
        if !self.email.isValidEmail() {
            showAlert(title: "Error", message: "Email no is valid")
            return false
        }
        
        if !self.phone.isValidPhone() {
            showAlert(title: "Error", message: "Cell phone no is valid")
            return false
        }
        
        return true
    }
    
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

