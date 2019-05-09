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
    
    var resultHackReceived:String = "127.0.0.1"
    
    var isRunning = false
    var progressBarTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultHack.text = mixResult(length: 16)
        progressBarWorking()
        progressView.progress = 0.0
        progressView.layer.cornerRadius = 5
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 5
        progressView.subviews[1].clipsToBounds = true
        hackImage.loadGif(name: "tenor")
        updateProgressView()
    }
    
    func progressBarWorking(){
        if(isRunning){
            progressBarTimer.invalidate()
        }else{
            progressView.progress = 0.0
            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(HackyngViewController.updateProgressView), userInfo: nil, repeats: true)
        }
        isRunning = !isRunning
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
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    func mixResult(length: Int) -> String{
        let randowResult =  resultHackReceived
        return String("#" + (0..<length).map{ _ in randowResult.randomElement()!})
    }

}
