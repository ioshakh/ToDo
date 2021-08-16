//
//  SignInViewController.swift
//  ToDo
//
//  Created by Shakhzod Bektemirov on 2021/08/15.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var emailFolder: UITextField!
    @IBOutlet weak var passwordFolder: UITextField!
    @IBOutlet weak var button: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initviews()
    }
    
    
    func initviews() {
        emailFolder.autocapitalizationType = .none
        passwordFolder.isSecureTextEntry = true
    }
    
    
    // sign in Firebase

    
    @IBAction func signInAction(_ sender: Any) {
        print("continue button tapped")
        guard let email = emailFolder.text , !email.isEmpty ,
              let password = passwordFolder.text , !password.isEmpty
              else {
            print("missing field data")
            return
        }
        FirebaseAuth.Auth.auth().signIn(withEmail: email , password: password , completion: {  [weak self] result , error in
            guard let strongSelf = self else {
                return
            }
            
            guard error == nil else {
                strongSelf.showCreatAccount(email: email , password: password)
                return
            }
            
            print("you have sign in")
            strongSelf.emailFolder.isHidden = true
            strongSelf.passwordFolder.isHidden = true
            strongSelf.button.isHidden = true
            strongSelf.emailFolder.resignFirstResponder()
            strongSelf.passwordFolder.resignFirstResponder()
           
        })
    }

    // SignIn Functions Alert
    
    // open new Controller
    
    func showCreatAccount(email : String , password : String) {

        let alert = UIAlertController(title: "Creat account", message: "Would you like to creat account", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {
            _ in
            let mm = csViewController(nibName: "csViewController", bundle: nil)
            self.navigationController?.pushViewController(mm, animated: true)
            

            FirebaseAuth.Auth.auth().createUser(withEmail: email , password: password, completion: {[weak self] result , error in

                guard let strongSelf = self else {
                    return
                }

                guard error == nil else {

                    return
                }
                strongSelf.emailFolder.isHidden = true
                strongSelf.passwordFolder.isHidden = true
                strongSelf.button.isHidden = true
                strongSelf.emailFolder.resignFirstResponder()
                strongSelf.passwordFolder.resignFirstResponder()
            })


        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            _ in
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
}


    
