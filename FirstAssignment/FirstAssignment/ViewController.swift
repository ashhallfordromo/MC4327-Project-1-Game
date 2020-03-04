//
//  ViewController.swift
//  FirstAssignment
//
//  Created by Romo, Ashley H on 2/24/20.
//  Copyright © 2020 Romo, Ashley H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //variables
    var score:Int = 0
    var name:String = ""
    var counter:Int = 30
    var timer = Timer()
    var isTimerRunning:Bool = false //This will be used to make sure only one timer is created at a time.
    var chars:Int = Int(arc4random_uniform(10) + 2)
    
    
    //outlets
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var autumnButton: UIButton!
    @IBOutlet weak var springButton: UIButton!
    @IBOutlet weak var myGreeting: UILabel!
    @IBOutlet weak var myName: UITextField!
    @IBOutlet weak var myScore: UILabel!
    
    @IBOutlet weak var pestsButton: UIButton!
    @IBOutlet weak var pruningButton: UIButton!
    @IBOutlet weak var compostButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    @IBOutlet weak var pruningImage: UIImageView!
    
    @IBOutlet weak var pestsImage: UIImageView!
    
    @IBOutlet weak var compostImage: UIImageView!
    
    @IBOutlet weak var waterImage: UIImageView!
    
    
    //actions
    
    @IBAction func myWater(_ sender: UIButton) {
        didScore(points:1)
        if isTimerRunning == false {
        runTimer()
        }
    }
    
    @IBAction func myCompost(_ sender: UIButton) {
        didScore(points:2)
        if isTimerRunning == false {
        runTimer()
        }
    }
    
    
    @IBAction func myPruning(_ sender: UIButton) {
        didScore(points:1)
        if isTimerRunning == false {
        runTimer()
        }
    }
    
    @IBAction func myPests(_ sender: UIButton) {
        didScore(points:5)
        if isTimerRunning == false {
        runTimer()
        }
    }
    
    @IBAction func myReset(_ sender: Any) {
      score = 0
        myScore.text = "Score: \(score)"
        timer.invalidate()
        counter = 30
        timerLabel.text = "\(counter)"
        isTimerRunning = false
        pestsButton.isHidden = false
        pruningButton.isHidden = false
        waterButton.isHidden = false
        compostButton.isHidden = false
        pestsImage.isHidden = false
         pruningImage.isHidden = false
         compostImage.isHidden = false
        waterImage.isHidden = false
        myImage.isHidden = true
         chars = Int(arc4random_uniform(10) + 2)
    }
    
    @IBAction func mySpring(_ sender: UIButton) {
        if isTimerRunning == false {
        runTimer()
        }
    }
    
    @IBAction func myAutumn(_ sender: UIButton) {
      if isTimerRunning == false {
        runTimer()
        }
    }
    @IBAction func mySubmit(_ sender: Any) {
        name = myName.text!
        // chars = name.count
        myGreeting.text = "Welcome to \(name)'s garden"
        myName.resignFirstResponder()
    }
    
    func runTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
            isTimerRunning = true
                }
        
   func didScore(points:Int){
         score = score + points
                if(score % chars == 0) {
                         score=0 }
    myScore.text = "Score: \(score)"
    if(score >= 31) {
        myImage.image = UIImage(named: "love")
        myImage.isHidden = false
            }
        else if(score >= 21 && score <= 30){
        myImage.image = UIImage(named: "good")
        myImage.isHidden = false
    }
    else if(score >= 10 && score <= 20){
        myImage.image = UIImage(named: "sad")
        myImage.isHidden = false
            }
    else  if (score <= 1 && score <= 10){
        myImage.image = UIImage(named: "gone")
        myImage.isHidden = false
            }
    }
    
    @objc func updateTimer() {
            counter -= 1
            timerLabel.text = "\(counter)"
            if(counter == 0) {
                timerLabel.text = "Time's Up!"
                timer.invalidate()

           pestsButton.isHidden = true
         pruningButton.isHidden = true
         compostButton.isHidden = true
        waterButton.isHidden = true
                pestsImage.isHidden = true
                 pruningImage.isHidden = true
                 compostImage.isHidden = true
                waterImage.isHidden = true
                myImage.isHidden = false
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

