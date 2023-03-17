//
//  ViewController.swift
//  Week_5
//
//  Created by labuser on 09/12/2022.
//

import UIKit
    //step 1: add the table view
    //step 2: Click the table view + control to outlets
    //step 3: Add table view cell and click the table view cell to system
    //step4: implement
class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    //step 5: array
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var agetxt: UITextField!
    @IBOutlet weak var table_view: UITableView!
    
    var array :[String] = []
    var arrayAge :[Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //array.append("Johon") //add iteam
        //array.remove(at: 2) //delete iteam
    }
    
    //step 6: tableview row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    //step 7: tableviewcell show item
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")//table view cell id
        
        cell?.textLabel?.text = array[indexPath.row] //title
        cell?.detailTextLabel?.text = arrayAge[indexPath.row].description //subtitle
        return cell!
    }
    
    @IBAction func add_button(_ sender: Any) {
        let name: String = text.text!.description
        let age : Int = Int(agetxt.text!.description)!
        array.append(name)
        arrayAge.append(age)
        table_view.reloadData()
        text.text = ""
        agetxt.text = ""
    }

    @IBAction func del(_ sender: Any) {
        array.removeLast()
        arrayAge.removeLast()
        table_view.reloadData()
    }
}

