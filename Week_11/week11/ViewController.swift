//
//  ViewController.swift
//  week11
//
//  Created by labuser on 20/01/2023.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var name: UITextField!
    var indicate = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginclick(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let request : NSFetchRequest<NSFetchRequestResult> =
            NSFetchRequest(entityName: "Users")
        request.predicate = NSPredicate(format: "username = %@", name.text!.description)
        do{
            let result = try manageContext.fetch(request)
            if(result.count > 0){
                let userObject = result[0] as! Users
                if(password.text!.description == userObject.password){
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let tabid = storyboard.instantiateViewController(withIdentifier: "tabid") as! UITabBarController
                    present(tabid, animated: true)
                }
                else{
                    let alert = UIAlertController(title: "Login Error", message: "Password unmatch", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(action)
                    present(alert,animated: true)
                }
            }
            else{
                let alert = UIAlertController(title: "Login Error", message: "Username unmatch", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert,animated: true)
            }
                
        }
        catch let error as NSError{
            print(error)
        }
    }
    
}

