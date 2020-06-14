//
//  ScoreDetails.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 6/13/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import Foundation

class ScoreDetails: Codable{
    var name: String
    var time: Int
    var moves: Int
    var location : LocationModel
    var date: Date

    init(name : String, time : Int, moves: Int, location: LocationModel,date : Date) {
        self.name = name
        self.time = time
        self.moves = moves
        self.location = location
        self.date = date
    }
    
    func compareTo(otherScore: ScoreDetails) -> Bool{
        if (compareByTime(time: otherScore.time)){
            if(equalTime(time: otherScore.time)){
                if(compareByMoves(moves: otherScore.moves)){
                    return true
                }
                return false
            }
            return true
        }
        return false
    }
    
    func compareByTime(time: Int) -> Bool {
        return self.time >= time
    }
    
    func equalTime(time: Int) -> Bool {
        return self.time == time
    }
    
    func compareByMoves(moves: Int) -> Bool {
        return self.moves >= moves
    }
    
}
