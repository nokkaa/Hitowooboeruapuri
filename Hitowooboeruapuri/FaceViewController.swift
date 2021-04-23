//
//  FaceViewController.swift
//  Hitowooboeruapuri
//
//  Created by nodoka on 2020/09/11.
//  Copyright © 2020 nodoka. All rights reserved.
//

import UIKit
import Firebase

class FaceViewController: UIViewController {
    var ref: DatabaseReference!

    @IBOutlet var ImageView:UIImageView!
    var faceType = 0
   @IBOutlet var ImageView2:UIImageView!
    var eyeType = 0
    @IBOutlet var ImageView3:UIImageView!
    var mouthType = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("height: \(self.view.bounds.height)")
    }
   
    @IBAction func button1(){
        ImageView.image = #imageLiteral(resourceName: "アセット 18")
        faceType = 1
        ImageView.frame = CGRect(x: 40, y: 50, width: 296, height: 234)
        ImageView2.frame = CGRect(x: 104, y: 140, width: 171, height: 99)
        ImageView3.frame = CGRect(x: 138, y: 200, width: 104, height: 82)
    }
    @IBAction func button2(){
        ImageView.image = #imageLiteral(resourceName: "アセット 19")
        faceType = 2
        ImageView.frame = CGRect(x: 40, y: 50, width: 296, height: 234)
        ImageView2.frame = CGRect(x: 77, y: 120, width: 160, height: 99)
        ImageView3.frame = CGRect(x: 88, y: 180, width: 140, height: 80)
    }
    @IBAction func button3(){
        ImageView.image = #imageLiteral(resourceName: "アセット 20")
        faceType = 3
        ImageView.frame = CGRect(x: 40, y: 50, width: 296, height: 234)
        ImageView2.frame = CGRect(x: 110, y: 125, width: 171, height: 99)
        ImageView3.frame = CGRect(x: 130, y: 180, width: 140, height: 80)
    }
    @IBAction func button4(){
        ImageView.image = #imageLiteral(resourceName: "アセット 8@3x.png")
        faceType = 4
        ImageView.frame = CGRect(x: 95, y: 42, width: 200, height: 150)
        ImageView2.frame = CGRect(x: 114, y: 140, width: 160, height: 99)
        ImageView3.frame = CGRect(x: 130, y: 200, width: 140, height: 80)
    }
    @IBAction func button5(){
           ImageView.image = #imageLiteral(resourceName: "megane.png")
           faceType = 5
    }
    @IBAction func button6(){
           ImageView2.image = #imageLiteral(resourceName: "ああ.png")
           eyeType = 1
    }
    @IBAction func button7(){
           ImageView2.image = #imageLiteral(resourceName: "いい.png")
           eyeType = 2
    }
    @IBAction func button8(){
           ImageView2.image = #imageLiteral(resourceName: "うう.png")
           eyeType = 3
    }
    @IBAction func button9(){
           ImageView3.image = #imageLiteral(resourceName: "ee.png")
           mouthType = 1
    }
    @IBAction func button10(){
           ImageView3.image = #imageLiteral(resourceName: "おお.png")
           mouthType = 2
    }
    @IBAction func button11(){
           ImageView3.image = #imageLiteral(resourceName: "かか口.png")
           mouthType = 3
    }
    @IBAction func hozonbutton(){
       
    }
    
    @IBAction func back2(){
        self.dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let viewController = segue.destination as! ViewController
        viewController.faceType = faceType
        viewController.eyeType = eyeType
        viewController.mouthType = mouthType
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
