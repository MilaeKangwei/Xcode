//
//  register.swift
//  week11
//
//  Created by labuser on 20/01/2023.
//

import UIKit
import CoreData

class register: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var cpassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var age: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func registerclick(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: manageContext)
        let userObject = NSManagedObject(entity: entity!, insertInto: manageContext) as! Users
        if(age.text != "" && email.text != "" && password.text != "" && cpassword.text != "" && name.text != ""){
            if(password.text==cpassword.text){
                userObject.name = name.text!.description
                userObject.email = email.text!.description
                userObject.password = password.text!.description
                userObject.age = Int32(age.text!.description)!
                userObject.username = username.text!.description

                do{
                    try manageContext.save()
                    self.dismiss(animated: true)
                }
                catch let error as NSError{
                    print(error)
                }

            }
            else{
                let alert = UIAlertController(title: "Error", message: "Password unmatch", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert,animated: true)
            }
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Blank not filled", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert,animated: true)
        }
    }
    

}
