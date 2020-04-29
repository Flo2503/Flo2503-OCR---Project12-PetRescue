//
//  SignUpViewController.swift
//  PetRescue
//
//  Created by Flo on 25/04/2020.
//  Copyright © 2020 Flo. All rights reserved.

import UIKit

class SignUpViewController: NavBarSetUp {

    private let identifier = "segueToSignUpDetails"

    @IBOutlet weak var emailAdress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordValidation: UITextField!
    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var labelSignUp: UILabel!

    @IBAction func dismissKeyboard(_ sender: Any) {
        emailAdress.resignFirstResponder()
        password.resignFirstResponder()
        passwordValidation.resignFirstResponder()
    }

    @IBAction func tapOnValidate(_ sender: Any) {

        let isEmailAddressValid = ValueManager.isValidEmailAddress(emailAddressString: emailAdress.text!, textField: emailAdress)
        let passwordAreEquals = ValueManager.passwordsAreEquals(passwordOne: password.text, passwordTwo: passwordValidation.text, fieldOne: password, fieldTwo: passwordValidation)
        let fieldIsNotEmpty = ValueManager.fieldIsNotEmpty([passwordValidation, password, emailAdress])
        let isValidPassword = ValueManager.isValidPassword(password: password.text, field: password)
        let isValidSecondPassword = ValueManager.isValidPassword(password: passwordValidation.text, field: passwordValidation)
        let userDoesNotExist = UserManager.userDoesNotExist(email: emailAdress.text, label: labelSignUp, button: validateButton)

        if isEmailAddressValid &&
            passwordAreEquals &&
            fieldIsNotEmpty &&
            isValidPassword &&
            isValidSecondPassword &&
            userDoesNotExist {
            UserManager.createUser(email: emailAdress.text!, password: password.text!)
            performSegue(withIdentifier: identifier, sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ValueManager.securePassword([password, passwordValidation])
        DisplaySetUp.buttonsetUp(validateButton)
    }

    override func viewWillAppear(_ animated: Bool) {
        DisplaySetUp.textFieldSetUp([emailAdress, password, passwordValidation])
    }
}
