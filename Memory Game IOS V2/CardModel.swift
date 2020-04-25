//
//  CardModel.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 4/25/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import Foundation

class CardModel {

    var generatedNumbersArray = [Int]()
    
    func getCards() -> [Card] {
        
        var generatedCardArray = [Card] ()
        
        while generatedNumbersArray.count < 6 {
            
            let rand = arc4random_uniform(13) + 1
            
            if generatedNumbersArray.contains(Int(rand)) == false {
                print(rand)
                let firstCard = Card()
                firstCard.imageName = "card\(rand)"
                generatedCardArray.append(firstCard)
                let secondCard = Card()
                secondCard.imageName = "card\(rand)"
                generatedCardArray.append(secondCard)
                
                generatedNumbersArray.append(Int(rand))
            }
            
        }
        
        for i in 0...generatedCardArray.count-1 {
            
            let rand = Int(arc4random_uniform(UInt32(generatedCardArray.count)))
            let temp = generatedCardArray[i]
            generatedCardArray[i] = generatedCardArray[rand]
            generatedCardArray[rand] = temp
            
        }
        
        return generatedCardArray
        
    }
}