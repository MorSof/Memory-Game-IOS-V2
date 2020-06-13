//
//  ScoreViewController.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 6/12/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var LBL_score: UILabel!
    @IBOutlet weak var LBL_time: UILabel!
    @IBOutlet weak var BTN_restart: UIButton!
    @IBOutlet weak var BTN_menu: UIButton!
    
    var num_of_moves : Int!
    var actualTime : Int!
    var lastGameNumOfRows: Int!;
    var lastGameNumOfCardsPerRow: Int!;
    var chosenOption : String!
//    var timerHelper : TimerHelper!
    var name : String!
    var myLocation : LocationModel!
//    var highScores = [HighScore]()
//    var userHighScore : HighScore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LBL_time.text = String(actualTime)
        LBL_score.text = String(num_of_moves)
    }
    

    @IBAction func onRestart(_ sender: UIButton) {
        self.performSegue(withIdentifier: "RestartTransition", sender: self)
    }
    
    
    @IBAction func onMenu(_ sender: UIButton) {
        self.performSegue(withIdentifier: "MenuTransition", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "RestartTransition"){
            print("here man!")
//            let gamePage = segue.destination as! GameController
//            gamePage.numOfRows = lastGameNumOfRows
//            gamePage.numOfCardsPerRow = lastGameNumOfCardsPerRow
//            gamePage.name = userHighScore.name
//            gamePage.myLocation = userHighScore.location
//
            
        } else if(segue.identifier == "MenuTransition"){
//            _ = segue.destination as! MenuController
        }
        
    }
    
}
