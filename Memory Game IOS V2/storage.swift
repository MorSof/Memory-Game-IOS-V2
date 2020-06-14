//
//  storage.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 6/13/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import Foundation

class Storage {
    
    static let SCORES_KEY = "SCORES"
    
    static func fetch() -> [ScoreDetails]{
        let json = UserDefaults.standard.string(forKey: SCORES_KEY)
        if let safeHighScoresJson = json {
            print("myArray:" + (json ?? "sex"))
            return convertJsonToScoreDetails(json: safeHighScoresJson)
        }
        return [ScoreDetails]()
    }
    
    static func save(scoreDetails : [ScoreDetails]) {
        let highScoresJson: String = convertScoreDetailsTJson(scoreDetails: scoreDetails)
        UserDefaults.standard.set(highScoresJson, forKey: SCORES_KEY)
    }
    
    static func convertJsonToScoreDetails(json: String) ->[ScoreDetails]{
        let decoder = JSONDecoder()
        let data = Data(json.utf8)
        do {
            return try decoder.decode([ScoreDetails].self, from: data)
        } catch {
            print("somthing went wrong in fromJsonToHighScoreList")
        }
        return [ScoreDetails]()
    }
    
    static func convertScoreDetailsTJson(scoreDetails : [ScoreDetails]) -> String{
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(scoreDetails)
        let json: String = String(data: data, encoding: .utf8)!
        return json
    }
    
}
