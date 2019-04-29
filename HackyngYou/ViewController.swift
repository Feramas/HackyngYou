//
//  ViewController.swift
//  HackyngYou
//
//  Created by Felipe Dos Santos Ramas on 24/04/2019.
//  Copyright © 2019 Felipe Dos Santos Ramas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hackText: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hackyng"{
            
            let destinyView = segue.destination as! HackyngViewController
            destinyView.resultHackReceived = hackText.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func mixNumbers() -> Int{
        if let hackNumber = Int(hackText.text!) {
            return hackNumber
        }else{
            return 0
        }
    }


}

