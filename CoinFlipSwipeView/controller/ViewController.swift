//
//  ViewController.swift
//  flipACoin
//
//  Created by Erik Hede on 2018-01-19.
//  Copyright © 2018 Erik Hede. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var coinImageview: UIImageView!
    
    
    var motionManager = CMMotionManager()
    
    var coin1 = Coin()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinImageview.image = coin1.coinImagesHeadsToHeads[0]
        
        // Letar efter left-swipe
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(leftSwipe)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // letar efter rörelser uppåt
        motionManager.accelerometerUpdateInterval = 0.2
        phoneShaked()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // utför segue vid left swipe
    @objc func swipeAction(swipe:UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "goRight", sender: self)
    }
    
    //funktion som kör flipCoin funktionen om telefonen rörs uppåt hastigt nog
    func phoneShaked() {
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data
            {
                
                print(myData)
                if myData.acceleration.z > 0.3
                {
                    print ("Du skakade telefonen")
                    self.flipCoin()
                    
                }
            }
        }
    }
    
    func flipCoin() {
        
        let zeroOrOne = RandomNumber().getRandomNumBetweenZeroAndOne()
        
        coin1.playCoinSound()
        
        if zeroOrOne == 1 {
        coin1.animateHeadsToTails(imageView: coinImageview)
        coinImageview.image = coin1.coinImagesHeadsToTails[6]
        } else {
        coin1.animateHeadsToHeads(imageView: coinImageview)
        coinImageview.image = coin1.coinImagesHeadsToHeads[0]
        }
}
  
    
    // action för singlaknappen
    @IBAction func flipButtonPushed(_ sender: UIButton) {
        flipCoin()
    }
    
}
