//
//  CustomCoin.swift
//  CoinFlipSwipeView
//
//  Created by Erik Hede on 2018-02-14.
//  Copyright © 2018 Erik Hede. All rights reserved.
//

// Class som skapar ett coin som består av en array av bilder som kan animeras med funktioner.
// klassen  håller två textsträngar, en för varje sida av myntet.
// klassen ärver Coin-klassens funktioner.


import Foundation
import UIKit

class CustomCoin : Coin {
    
    var coinImagesBlank : [UIImage] = []
    var coinTextHeads : String
    var coinTextTails : String
    
    override init() {
        self.coinTextHeads = ""
        self.coinTextTails = ""
        
        super.init()
        self.coinImagesBlank = createImageArray(total: 7, imagePrefix: "coin2")

    }
    
    //animerar arrayen coinImagesBlank
    func animateBlankCoin(imageView: UIImageView) {
        imageView.animationImages = self.coinImagesBlank
        imageView.animationDuration = 0.3
        imageView.animationRepeatCount = 3
        imageView.startAnimating()        
    }
    
    
}


