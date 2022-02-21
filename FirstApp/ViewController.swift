//
//  ViewController.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 05.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupTextFields()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    @objc func keyboardWasShown(notification: Notification){
        print("keyboardWasShown🎹🎹🎹🎹🎹")
    }
    
    @objc func keyboardWillBeHidden(notification: Notification){
        print("keyboardWillBeHidden🎰🎰🎰🎰🎰")
    }
    
    @IBAction func didTapOnLogin(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "loginSegue" else {return false}
        if checkForValidationData() {
            return true

        } else {
            showAllert()
            return false
        }
    }
}

private extension ViewController {
    
    func setupTextFields() {
     loginTextField.keyboardType = .emailAddress
        passwordTextField.keyboardType = .numberPad
    }
    
    func checkForValidationData() -> Bool {
        guard let loginText = loginTextField.text,
              let passwordText = passwordTextField.text else {
                  return false
              }
        let isValidData = loginText == "" && passwordText == ""
        return isValidData
        
    }
    
    func showAllert(){
        let allertViewController = UIAlertController(title: "Error", message: "Enter valid login/password", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "OK", style: .cancel, handler: //nil
            {_ in
            self.passwordTextField.text = ""
            self.loginTextField.text = .none
            }

        )
        allertViewController.addAction(doneButton)
        
        present(allertViewController, animated: true, completion: nil)
    }
    
}

