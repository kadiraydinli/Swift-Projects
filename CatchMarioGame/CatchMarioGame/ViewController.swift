//
//  ViewController.swift
//  CatchMarioGame
//
//  Created by Kadir Aydınlı on 21.11.2022.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    // Variables
    var timer = Timer()
    var counter = 10
    var score = 0
    var hideTimer = Timer()
    var highScore = 0

    // Labels
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    var marioArray = [UIImageView]()
    
    // ImageViews
    @IBOutlet weak var mario: UIImageView!
    @IBOutlet weak var mario2: UIImageView!
    @IBOutlet weak var mario3: UIImageView!
    @IBOutlet weak var mario4: UIImageView!
    @IBOutlet weak var mario5: UIImageView!
    @IBOutlet weak var mario6: UIImageView!
    @IBOutlet weak var mario7: UIImageView!
    @IBOutlet weak var mario8: UIImageView!
    @IBOutlet weak var mario9: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Highscore Check
        let storedHighscore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighscore == nil {
            highScore = 0
            highscoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighscore as? Int {
            highScore = newScore
            highscoreLabel.text = "Highscore: \(newScore)"
        }
        
        scoreLabel.text = "Score: \(score)"
        
        mario.isUserInteractionEnabled = true
        mario2.isUserInteractionEnabled = true
        mario3.isUserInteractionEnabled = true
        mario4.isUserInteractionEnabled = true
        mario5.isUserInteractionEnabled = true
        mario6.isUserInteractionEnabled = true
        mario7.isUserInteractionEnabled = true
        mario8.isUserInteractionEnabled = true
        mario9.isUserInteractionEnabled = true
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        mario.addGestureRecognizer(recognizer)
        mario2.addGestureRecognizer(recognizer2)
        mario3.addGestureRecognizer(recognizer3)
        mario4.addGestureRecognizer(recognizer4)
        mario5.addGestureRecognizer(recognizer5)
        mario6.addGestureRecognizer(recognizer6)
        mario7.addGestureRecognizer(recognizer7)
        mario8.addGestureRecognizer(recognizer8)
        mario9.addGestureRecognizer(recognizer9)
        
        marioArray = [mario, mario2, mario3, mario4, mario5, mario6, mario7, mario8, mario9]
        
        hideMario()
        
        // Timers
        timerRun()
        hideTimerRun()
    }
    
    func timerRun() {
        counter = 10
        timeLabel.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    func hideTimerRun() {
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideMario), userInfo: nil, repeats: true)
    }
    
    @objc func hideMario() {
        for i in marioArray {
            i.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(marioArray.count - 1)))
        
        marioArray[random].isHidden = false
    }
    
    @objc func countDown() {
        counter -= 1
        timeLabel.text = "Time: \(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for i in marioArray {
                i.isHidden = true
            }
            
            if self.score >= self.highScore {
                self.highScore = self.score
                highscoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
            
            timeLabel.text = "Time Over"
            
            let alert = UIAlertController(title: "Time Over", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Replay", style: UIAlertAction.Style.default, handler: { UIAlertAction
                in
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = "Time: \(self.counter)"
                self.timerRun()
                self.hideTimerRun()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }

    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
        AudioServicesPlaySystemSound(1519)
    }

}

