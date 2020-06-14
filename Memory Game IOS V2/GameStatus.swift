//
//  GameStatus.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 6/12/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import Foundation
class GameStatus {
    
    var location : LocationModel?
    var level: String?
    var name: String?
    var time: Int?
    var moves: Int?
    var num_of_cards: Int?
    var num_of_rows: Int?
    var num_of_cols: Int?
    var date: Date?

    init() {
        date = Date()
    }
    
    public func set_locartion(location: LocationModel!){
        self.location = location
    }
    
    public func set_level(level: String!){
        self.level = level
    }
    
    public func set_name(name: String!){
        self.name = name
    }
    
    public func set_time(time: Int!){
        self.time = time
    }
    
    public func set_moves(moves: Int!){
        self.moves = moves
    }
    
    public func set_num_of_cards(num_of_cards: Int!){
        self.num_of_cards = num_of_cards
    }
    
    public func set_num_of_rows(num_of_rows: Int!){
        self.num_of_rows = num_of_rows
    }
    
    public func set_num_of_cols(num_of_cols: Int!){
        self.num_of_cols = num_of_cols
    }
    
    public func get_locartion() -> LocationModel{
        return self.location!
    }
       
    public func get_level() -> String{
        return self.level!
    }
       
    public func get_name() -> String{
        return self.name!
    }
    
    public func get_time() -> Int!{
        return self.time!
    }
    
    public func get_moves() -> Int!{
        return self.moves!
    }
    
    public func get_num_of_cards() -> Int!{
        return self.num_of_cards!
    }
       
    public func get_num_of_rows() -> Int!{
        return self.num_of_rows!
    }
       
    public func get_num_of_cols() -> Int!{
        return self.num_of_cols!
    }
    
    public func get_date() -> Date!{
        return self.date!
    }
}
