//
//  ViewController.swift
//  Week_8
//
//  Created by labuser on 30/12/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var ageTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var tView: UITableView!
    
    var array : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = "Name: \(array[indexPath.row].name)"
        cell?.detailTextLabel?.text = "Age: \(array[indexPath.row].age)"
        return cell!
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let nameT : String = nameTxt.text!.description
        let ageT : Int = Int(ageTxt.text!.description)!
        let emailT : String = emailTxt.text!.description
        //declare object
        let u1 = User(name: nameT, age: ageT, email: emailT)
        array.append(u1)
        tView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "details"){
            let destination = segue.destination as!
                DetailsViewController
            let person = array[tView.indexPathForSelectedRow!.row]
            destination.user = person
        }
    }
}

