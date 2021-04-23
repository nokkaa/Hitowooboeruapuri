//
//  LoginViewController.swift
//  Hitowooboeruapuri
//
//  Created by nodoka on 2020/08/14.
//  Copyright © 2020 nodoka. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var logintextfield:UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushLogin(_ sender: Any) {
        performSegue(withIdentifier:"toViewController",sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toViewController"{
            let ViewController = segue.destination as!ViewController
            //ViewController.loginName = logintextfield.text
        }
        
    }
    @IBAction func kaotourokubutton(_ sender: Any){
        performSegue(withIdentifier:"toFaceViewController",sender: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
