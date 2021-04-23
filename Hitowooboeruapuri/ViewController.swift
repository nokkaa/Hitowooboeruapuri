//
//  ViewController.swift
//  Hitowooboeruapuri
//
//  Created by nodoka on 2020/07/31.
//  Copyright © 2020 nodoka. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var namelabel:UILabel!
    @IBOutlet var nametextfield:UITextField!
    
    var ref: DatabaseReference!
    var faceType: Int!
    var eyeType: Int!
    var mouthType: Int = 0
    var loginName:String!
    var seibetu:String!
    var kankei:String!
    var seibetuArray = ["male","female","other"]
    var kankeiArray = ["schoolfriend","lessonfriend","family"]
    var selectedSeibetu = "male"
    var selectedKankei = "schoolfriend"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        nametextfield.delegate = self
        
        ref.child("users/\(loginName)").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["username"] as? String ?? ""
            print(username)
            self.nametextfield.text = username
            
            let nickname = value?["nickname"] as? String ?? ""
            print(nickname)
            
            let seibetu = value?["seibetu"] as? String ?? ""
            print(seibetu)
            
            let kankei = value?["kankei"] as? String ?? ""
            print(kankei)
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    @IBAction func tourokuButton() {
        //        self.ref.child("users/username").setValue(["username":username])
        ref.child("users/\(String(describing: nametextfield.text!))/username").setValue(nametextfield.text!)
        ref.child("users/\(String(describing: nametextfield.text!))/seibetu").setValue(seibetu)
        ref.child("users/\(String(describing: nametextfield.text!))/kankei").setValue(kankei)
        ref.child("users/\(String(describing: nametextfield.text!))/faceType").setValue(faceType)
        ref.child("users/\(String(describing: nametextfield.text!))/eyeType").setValue(eyeType)
        ref.child("users/\(String(describing: nametextfield.text!))/mouthType").setValue(mouthType)
        let currentSeibetu: String!
        if seibetu == "male" {
            currentSeibetu = "男"
        } else if seibetu == "female" {
            currentSeibetu = "女"
        } else if seibetu == "other"{
            currentSeibetu = "その他"
        } else {
            currentSeibetu = ""
        }
        
        let currentKankei: String!
        if kankei == "schoolfriend"{
            currentKankei = "学校の友達"
        } else if kankei == "lessonfriend"{
            currentKankei = "習い事の友達"
        } else  {
            currentKankei = "家族"
            
            
        }
        let alert: UIAlertController = UIAlertController(title:"名前:\( nametextfield.text!)\n 性別:\(currentSeibetu!)\n 関係:\(currentKankei!)",message: "",preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title:"OK",
                style: .default,
                handler: { action in
                    print("OKボタンが押されました！")
                    self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)

                }
            )
            
        )
        present(alert, animated: true,completion: nil)
        
    }
    
    @IBAction func pushSeibetu(sender:UIButton){
        seibetu = seibetuArray[sender.tag]
    }
    @IBAction func pushKankei(sender:UIButton){
        kankei = kankeiArray[sender.tag]
    }
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
}
