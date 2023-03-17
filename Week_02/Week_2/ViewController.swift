//
//  ViewController.swift
//  Week_2
//
//  Created by labuser on 25/11/2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var Switch1: UISwitch!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var switf_label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickMe(_ sender: Any) {
        if (label.text ==  "Hello World"){
            label.text = "Welcome to xxxxx"
        }
        else{
            label.text = "Hello World"
        }
    }
        
    @IBAction func switch_click(_ sender: Any) {
        if(Switch1.isOn){
            switf_label.text = "On"
            label.isHidden = false
            button.isHidden = false
        }
        else{
            switf_label.text = "Off"
            label.isHidden = true
            button.isHidden = true

        }
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        label3.text = slider.value.description
    }
    
    
 
    
}

