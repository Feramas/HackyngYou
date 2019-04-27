//
//  HackyngViewController.swift
//  HackyngYou
//
//  Created by Felipe Dos Santos Ramas on 24/04/2019.
//  Copyright © 2019 Felipe Dos Santos Ramas. All rights reserved.
//

import UIKit

class HackyngViewController: UIViewController {

    @IBOutlet weak var hackImage: UIImageView!
    @IBOutlet weak var resultHack: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    var isRunning = false
    var progressBarTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0.0
        hackImage.loadGif(name: "tenor")
    }
    
    func progressBarWorking(){
        if(isRunning){
            progressBarTimer.invalidate()
        }else{
            progressView.progress = 0.0
            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(HackyngViewController.updateProgressView), userInfo: nil, repeats: true)
            isRunning = !isRunning
        }
    }
    
    @objc func updateProgressView(){
        progressView.progress += 0.1
        progressView.setProgress(progressView.progress, animated: true)
        if(progressView.progress == 1.0)
        {
            progressBarTimer.invalidate()
            isRunning = false
        }
    }
    
}
