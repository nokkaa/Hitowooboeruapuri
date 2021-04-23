//
//  ListViewController.swift
//  Hitowooboeruapuri
//
//  Created by nodoka on 2020/08/22.
//  Copyright © 2020 nodoka. All rights reserved.
//

import UIKit
import Firebase


class ListViewController: UIViewController, UITableViewDataSource {
    
    var ref: DatabaseReference!
    @IBOutlet var seibetuLabel:UILabel!
    @IBOutlet var kankeiLabel:UILabel!
    @IBOutlet var nameLabel:UILabel!
    
    
    
    @IBOutlet var table:UITableView!
    var seibetu:String!
    var kankei:String!
    var seibetuArray: [String]  = []
    var kankeiArray: [String]  = []
    var nameArray: [String] = []
    var facetypeArray:[Int] = []
    var eyetypeArray:[Int] = []
    var mouthtypeArray:[Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        table.dataSource = self
        
        ref.child("users").observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as! NSDictionary
            for (key, value) in value {
                self.nameArray.append(key as! String)
                self.kankeiArray.append((value as! NSDictionary)["kankei"] as! String)
                self.seibetuArray.append((value as! NSDictionary)["seibetu"] as! String)
                self.facetypeArray.append((value as! NSDictionary)["faceType"] as! Int)
                self.eyetypeArray.append((value as! NSDictionary)["eyeType"] as! Int)
                self.mouthtypeArray.append((value as! NSDictionary)["mouthType"] as! Int)
            }
            self.table.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.table.reloadData()
    }
    
    @IBAction func ModoruButton(){
         self.dismiss(animated: true, completion: nil)
     }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func  tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell") as! ListTableViewCell
        cell.kankeiLabel.text = "aaaa"
        //            cell?.seibetuLabel?.text = seibetuArray
        //            let nameLabel = cell?.viewWithTag(0)
        //
        //            let seibetuLabel = cell?.viewWithTag(1)as!UILabel
        //            seibetuLabel.text = seibetu
        //
        //            let kankeiLabel = cell?.viewWithTag(2)as!UILabel
        cell.nameLabel.text = nameArray[indexPath.row]
        cell.kankeiLabel.text = kankeiArray[indexPath.row]
        cell.seibetuLabel.text = seibetuArray[indexPath.row]
        
        
        if seibetuArray[indexPath.row] == "male" {
            cell.seibetuLabel.text = "男"
            
        } else if seibetuArray[indexPath.row] == "female"{
            cell.seibetuLabel.text = "女"
        }else if seibetuArray[indexPath.row] == "other"{
            cell.seibetuLabel.text = "その他"
        }
        
        if kankeiArray[indexPath.row] == "schoolfriend"{
            cell.kankeiLabel.text = "学校の友達"
        }else if kankeiArray[indexPath.row] == "lessonfriend"{
            cell.kankeiLabel.text = "学校の友達"
        }else if kankeiArray[indexPath.row] == "family"{
            cell.kankeiLabel.text = "家族"
        }
        
        if facetypeArray[indexPath.row] == 1{
            cell.faceImageview.image = #imageLiteral(resourceName: "アセット 18@3x.png")
            cell.eyeImageview.frame = CGRect(x: 62, y: 95, width: 74, height: 61)
            cell.mouthImageview.frame = CGRect(x: 60, y: 126, width: 79, height: 61)
        }else if facetypeArray[indexPath.row] == 2{
            cell.faceImageview.image = #imageLiteral(resourceName: "アセット 19")
            cell.faceImageview.frame = CGRect(x: 20, y: 51, width: 159, height: 136)
            cell.eyeImageview.frame = CGRect(x: 40, y: 96, width: 74, height: 61)
            cell.mouthImageview.frame = CGRect(x: 40, y: 126, width: 79, height: 61)
        }else if facetypeArray[indexPath.row] == 3{
            cell.faceImageview.image = #imageLiteral(resourceName: "アセット 20@3x.png")
            cell.faceImageview.frame = CGRect(x: 20, y: 51, width: 159, height: 136)
            cell.eyeImageview.frame = CGRect(x: 62, y: 95, width: 74, height: 61)
            cell.mouthImageview.frame = CGRect(x: 60, y: 126, width: 79, height: 61)
        }else if facetypeArray[indexPath.row] == 4{
            cell.faceImageview.image = #imageLiteral(resourceName: "アセット 8@3x.png")
            cell.faceImageview.frame = CGRect(x: 20, y: 30, width: 160, height: 70)
            cell.eyeImageview.frame = CGRect(x: 63, y: 77, width: 79, height: 61)
            cell.mouthImageview.frame = CGRect(x: 67, y: 105, width: 70, height: 55)
        }
        if eyetypeArray[indexPath.row] == 1{
            cell.eyeImageview.image = #imageLiteral(resourceName: "ああ.png")
        }else if eyetypeArray[indexPath.row] == 2{
            cell.eyeImageview.image = #imageLiteral(resourceName: "いい.png")
        } else if eyetypeArray[indexPath.row] == 3{
            cell.eyeImageview.image = #imageLiteral(resourceName: "うう.png")
        }
        if mouthtypeArray[indexPath.row] == 1{
            cell.mouthImageview.image = #imageLiteral(resourceName: "ee.png")
        }else if mouthtypeArray[indexPath.row] == 2{
            cell.mouthImageview.image = #imageLiteral(resourceName: "おお.png")
        }else if mouthtypeArray[indexPath.row] == 3{
            
            cell.mouthImageview.image = #imageLiteral(resourceName: "かか口.png") }
        // Do any additional setup after loading the view.
        
            
        
        return cell
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
    

