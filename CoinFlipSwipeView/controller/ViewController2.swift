//
//  ViewController2.swift
//  flipACoin
//
//  Created by Erik Hede on 2018-02-08.
//  Copyright © 2018 Erik Hede. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController2: UIViewController {
    
    @IBOutlet weak var coinText: UILabel!
    @IBOutlet weak var coinImageview2: UIImageView!
    @IBOutlet weak var headsTextField: UITextField!
    @IBOutlet weak var tailsTextField: UITextField!
    @IBOutlet weak var tossButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var makeYourOwnLabel: UILabel!
    
    var motionManager = CMMotionManager()
    
    var coin2 = CustomCoin()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headsTextField.delegate = self
        tailsTextField.delegate = self
                
        tossButton.isEnabled = false
        tossButton.isHidden = true
        
        
        coinImageview2.image = coin2.coinImagesBlank[0]
        
        // Letar efter right-swipe
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        motionManager.accelerometerUpdateInterval = 0.2
        phoneShaked()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    // funktion för singling
    func flipCoin() {
        
        let zeroOrOne = RandomNumber().getRandomNumBetweenZeroAndOne()
        
        coin2.playCoinSound()
        coin2.animateBlankCoin(imageView: coinImageview2)
        
        
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.9, repeats: false) { (timer) in
            
            if zeroOrOne == 0 {
                if self.coinText.text == self.coin2.coinTextHeads {
                    self.coinText.text = self.coin2.coinTextTails
                    
                    print(zeroOrOne)
                }
            } else {
                self.coinText.text = self.coin2.coinTextHeads
                
                print(zeroOrOne)
            }
        }
        
    }
    
    // utför segue vig right-swipe
    @objc func swipeAction(swipe:UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "goLeft", sender: self)
    }
    
    // tar bort first responder vid tryck utanför tangentbordet
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        headsTextField.resignFirstResponder()
        tailsTextField.resignFirstResponder()
    }
    
    // action för att lägga till text och aktivera singla-knappen
    @IBAction func AddButton(_ sender: UIButton) {
        
        if let text = headsTextField.text, !text.isEmpty {
            print("text: " + headsTextField.text!)
            coin2.coinTextHeads = text
        } else {
            coin2.coinTextHeads = self.headsTextField.placeholder!
        }
        
        if let text2 = tailsTextField.text, !text2.isEmpty {
            coin2.coinTextTails = text2
        } else {
            coin2.coinTextTails = self.tailsTextField.placeholder!
        }
        
        // fixa!!!
        self.coinText.text = coin2.coinTextHeads
        
        tossButton.isEnabled = true
        tossButton.isHidden = false
        
        headsTextField.isHidden = true
        tailsTextField.isHidden = true
        addButton.isHidden = true
        makeYourOwnLabel.isHidden = true
    }
    
    // Action för singla-knappen
    @IBAction func flipButtonPushed(_ sender: UIButton) {
        flipCoin()
    }
}
// tar bort first responder vid return
extension ViewController2 : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}





