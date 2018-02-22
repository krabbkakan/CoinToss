//
//  Coin.swift
//  CoinFlipSwipeView
//
//  Created by Erik Hede on 2018-02-14.
//  Copyright © 2018 Erik Hede. All rights reserved.

// Klass som skapar tt coin som består av två arrayer av bilder som kan animeras med funktioner.
// Den ena arrayen slutar på klave, den andra på krona.
// klassen har en funktion för att spela upp ett ljud.

import Foundation
import UIKit
import AVFoundation

class Coin {
    
    var coinImagesHeadsToHeads : [UIImage] = []
    var coinImagesHeadsToTails : [UIImage] = []
    var audioPlayer : AVAudioPlayer!
    
    init() {
        coinImagesHeadsToHeads = createImageArray(total: 12, imagePrefix: "coin")
        coinImagesHeadsToTails = createImageArray(total: 7, imagePrefix: "coin1")
    }
    
    // lägger in bilder i en array av typen UIImage
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        
        var imageArray: [UIImage] = []
        
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)-\(imageCount).png"
            let image = UIImage(named: imageName)!
            
            imageArray.append(image)
        }
        return imageArray
    }
    
    // Animerar en array av UIImages
    // Animationen går från krona till krona
    func animateHeadsToHeads(imageView: UIImageView) {
        imageView.animationImages = self.coinImagesHeadsToHeads
        imageView.animationDuration = 0.3
        imageView.animationRepeatCount = 3
        imageView.startAnimating()
    }
    
    // Animerar en array av UIImages
    // Animationen går från krona till klave
    func animateHeadsToTails(imageView: UIImageView) {
        imageView.animationImages = self.coinImagesHeadsToTails
        imageView.animationDuration = 0.3
        imageView.animationRepeatCount = 5
        imageView.startAnimating()
    }
    
    // spelar upp ett slantsinglingsljud
    func playCoinSound() {
        
        let soundURL = Bundle.main.url(forResource: "coinflip", withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        
        audioPlayer.play()
    }

}




