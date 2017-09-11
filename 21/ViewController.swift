//
//  ViewController.swift
//  21
//
//  Created by Sebastian Asp on 2017-09-11.
//  Copyright © 2017 Sebastian Asp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var upperLeft: UIImageView!
    @IBOutlet weak var upperRight: UIImageView!
    
    @IBOutlet weak var lowerLeft: UIImageView!
    @IBOutlet weak var lowerRight: UIImageView!
    
    @IBOutlet weak var pointUser: UILabel!
    @IBOutlet weak var pointCpu: UILabel!
    
    @IBOutlet weak var totalUpper: UILabel!
    @IBOutlet weak var totalLower: UILabel!
    
    @IBOutlet weak var countClicks: UILabel!
    
    
    let cardsInDeck = ["nil1", "nil2", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king", "ace"]
    
    var user = 0
    var cpu = 0
    var clicks = 0
    
    // Count clicks
    func clickerCounter () {
        clicks += 1
    }
    
    // Reset counter
    func resetCounter() {
        if clicks == 100 {
            clicks = 0
            user = 0
            cpu = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Button (Deal) clicked
    
    @IBAction func dealButton(_ sender: Any) {
        let leftUpperNumber = Int(arc4random_uniform(13) + 2)
        upperLeft.image = UIImage(named: cardsInDeck[leftUpperNumber])
        
        let rightUpperNumber = Int(arc4random_uniform(13) + 2)
        upperRight.image = UIImage(named: cardsInDeck[rightUpperNumber])
        
        let leftLowerNumber = Int(arc4random_uniform(13) + 2)
        lowerLeft.image = UIImage(named: cardsInDeck[leftLowerNumber])
        
        let rightLowerNumber = Int(arc4random_uniform(13) + 2)
        lowerRight.image = UIImage(named: cardsInDeck[rightLowerNumber])
        
        // Totalt points upper and lower User
        
        totalUpper.text = String(leftUpperNumber + rightUpperNumber)
        totalLower.text = String(leftLowerNumber + rightLowerNumber)
        
        // Count clicks and reset clicks
        clickerCounter()
        resetCounter()
        
        
        // Decide who wins
        if leftLowerNumber + rightLowerNumber == 21 {
            cpu += 1
        }
        else if
            leftUpperNumber + rightUpperNumber == 21 {
            user += 1
        }
        else {
        }
        
        // Update textfield with points
        pointUser.text = String("USER 1: \(user)")
        pointCpu.text = String("USER 2: \(cpu)")
        countClicks.text = String("CLICKS: \(clicks)")
        
    }
}

