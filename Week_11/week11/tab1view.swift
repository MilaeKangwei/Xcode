//
//  tab1view.swift
//  week11
//
//  Created by labuser on 20/01/2023.
//

import UIKit
import CoreData

class tab1view: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tview: UITableView!
    var array :[Users] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let request : NSFetchRequest<NSFetchRequestResult> =
            NSFetchRequest(entityName: "Users")
        do{
            let result = try manageContext.fetch(request)
            array = result as! [Users]
        }
        catch let error as NSError{
            print(error)
        }

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = array[indexPath.row].username
        cell?.detailTextLabel?.text = array[indexPath.row].email
        return cell!
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailSegue"){
            let destination = segue.destination as! DataiViewController
            let data = array[tview.indexPathForSelectedRow!.row]
            destination.user = data
        }
    }

}
