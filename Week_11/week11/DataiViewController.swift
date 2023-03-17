//
//  DataiViewController.swift
//  week11
//
//  Created by labuser on 03/02/2023.
//

import UIKit
import CoreData

class DataiViewController: UIViewController {
    var user : Users?
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var UsernameTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UsernameTxt.text = user!.username!.description
        nameTxt.text = user!.name!.description
        emailTxt.text = user!.email!.description
        ageTxt.text = user!.age.description
        
    }

    @IBAction func UpdateClick(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let request : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Users")
        request.predicate = NSPredicate(format: "username = %@", UsernameTxt.text!.description)
        
        do{
            let result = try manageContext.fetch(request)
            if (result.count > 0){
                let object = result[0] as! NSManagedObject
                object.setValue(nameTxt.text!.description, forKey: "name")
                object.setValue(Int32(ageTxt.text!.description), forKey: "age")
                object.setValue(emailTxt.text!.description, forKey: "email")
                try manageContext.save()
               
                
                let alert = UIAlertController(title: "Success", message: "Save successfully", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(action)
                present(alert, animated: true)
                
            }
        }
        catch let error as NSError{
            print(error)
        }
    }
    
    
    @IBAction func DeleteClick(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let request : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Users")
        request.predicate = NSPredicate(format: "username = %@", UsernameTxt.text!.description)
        
        do{
            let result = try manageContext.fetch(request)
            if(result.count > 0){
                let object = result[0] as! NSManagedObject
                manageContext.delete(object)
                let alert = UIAlertController(title: "Success", message: "Delete successfully", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(action)
                present(alert, animated: true)
            }
        }
        catch let error as NSError{
            print(error)
        }
    }
}
