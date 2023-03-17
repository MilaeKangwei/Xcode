//
//  ViewController.swift
//  Week_7
//
//  Created by labuser on 23/12/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var dateText: UITextField!
    
    @IBOutlet weak var switchDone: UISwitch!
    
    @IBOutlet weak var tText: UITableView!
    
    var arrayTitle :[String] = []
    var arrayDate : [String] = []
    var arrayDone : [Bool] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = "Title: \(arrayTitle[indexPath.row])"
        
        cell?.detailTextLabel?.text = "Due Date:\(arrayDate[indexPath.row])"
        
        if(arrayDone[indexPath.row]){
            cell?.imageView?.image = UIImage(named: "tick")
        }
        else{
            cell?.imageView?.image = UIImage(named: "cross")
        }
        return cell!
    }

    @IBAction func Submit(_ sender: Any) {
        arrayTitle.append(titleText.text!.description)
        arrayDate.append(dateText.text!.description)
        arrayDone.append(switchDone.isOn)
        tText.reloadData()
    }
    
}

