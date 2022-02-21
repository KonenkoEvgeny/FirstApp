//
//  LoginViewController.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 27.01.2022.
//

import UIKit

@IBDesignable class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInOutlet: UIButton!
      
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var vkView: UIView!
    
  
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupTextFields()
            
            vkView.layer.cornerRadius = 45
//            backView.layer.cornerRadius = 45
//            backView.layer.shadowColor = UIColor.black.cgColor
//            backView.layer.shadowOffset = CGSize (width: 10, height: 10)
//            backView.layer.shadowRadius = 20
//            backView.layer.shadowOpacity = 0.7
            
            addShadow(view: loginTextField)
            addShadow(view: passwordTextField)
            addShadow(view: signInOutlet)
            
        }

    @IBAction func signInAction(_ sender: Any) {
        let session = Session.shared
        session.name = "User name"
        session.token = UUID().uuidString
        
        print (session.name)
        print (session.token)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        }
        
        @objc func keyboardWasShown(notification: Notification){
      //      print("keyboardWasShown🎹🎹🎹🎹🎹")
        }
        
        @objc func keyboardWillBeHidden(notification: Notification){
        //    print("keyboardWillBeHidden🎰🎰🎰🎰🎰")
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
    
    func addShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 1
    }
    
}

private extension LoginViewController {
        
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

