//
//  LoginPageViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class LoginPageViewController: UIViewController , UITextFieldDelegate{

    var ud = UserDefaults.standard
    
    @IBOutlet weak var sw: UISwitch!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        username.delegate = self
        password.delegate = self

        if (sw.isOn) { // if the switch is on, remember the last username/password combo entered and automatically enter it for the user
            username.text = ud.string(forKey: "username")
            password.text = ud.string(forKey: "username")
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        
    }
    
  

}
