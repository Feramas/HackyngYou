//
//  ViewController.swift
//  HackyngYou
//
//  Created by Felipe Dos Santos Ramas on 24/04/2019.
//  Copyright © 2019 Felipe Dos Santos Ramas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var hackText: UITextField!
    
    let maxCharCount = 11
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hackyng"{
            
            let destinyView = segue.destination as! HackyngViewController
            destinyView.resultHackReceived = hackText.text!
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return textField.text!.characters.count + string.characters.count <= self.maxCharCount
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hackText.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
}

