//
//  ViewController.swift
//  timerApp
//
//  Created by Kadir Aydınlı on 21.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var counter = 0

    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        counter = 10
        timeLabel.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction() {
        timeLabel.text = "Time: \(counter)"
        counter -= 1
        
        if counter == 0 {
            timer.invalidate()
            timeLabel.text = "Time's Over"
        }
    }
    
    /*
    override func viewDidAppear(_ animated: Bool) {
        counter = 10
        
        for time in 1...10 {
            counter = counter - 1
            timeLabel.text = "Time: \(counter)"
            Thread.sleep(forTimeInterval: 100)
        }
    }
    */

    @IBAction func timeButton(_ sender: Any) {
        print("tapped")
    }
    
}

