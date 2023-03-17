//
//  DetailsViewController.swift
//  Week_8
//
//  Created by labuser on 30/12/2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var emailTxt: UILabel!
    @IBOutlet weak var ageTxt: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTxt.text = "Name: \(user!.name)"
        ageTxt.text = "Age: \(user!.age)"
        emailTxt.text = "Email: \(user!.email)"
    }


}
