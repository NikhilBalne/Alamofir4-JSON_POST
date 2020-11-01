//
//  ViewController.swift
//  JSOS_POST
//
//  Created by Nikhil Balne on 28/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text = "eve.holt@reqres.in"
        passwordTextField.text = "cityslicka"
        
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let loginUrl = "https://reqres.in/api/login"
        let params:[String:String] = ["email": emailTextField.text!,"password":passwordTextField.text!]
        
//        let requestObj = LoginRequest(email: emailTextField.text!, password: passwordTextField.text!)
        
        NetworkingClient.networkingClient.excutePostServiceCall(url:loginUrl, controller:self, parameters:params){ response in
            
            if response.response?.statusCode == 200 {
                print("StatusCode:\(response.response!.statusCode)")
                
                do {
                    
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(LoginResponse.self, from: response.data!)
                    
                    print("Response:\(results)")
                    
                } catch let error {
                    print("ErrorDescription:",error.localizedDescription)
                }
                
            } else {
                print("StatusCode:\(response.response!.statusCode)")
            
            }
        }
        
    }
    
}

