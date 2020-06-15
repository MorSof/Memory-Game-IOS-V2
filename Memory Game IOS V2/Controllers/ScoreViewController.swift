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
    
    
    var allScores = [ScoreDetails]()
    var myScore: ScoreDetails!
    var gameStatus: GameStatus!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myScore = ScoreDetails(name: gameStatus.get_name(), time: gameStatus.get_time(), moves: gameStatus.get_moves(), location: gameStatus.get_locartion(), date: gameStatus.get_date())
        LBL_time.text = TimeDateUtil.secondsToTime(gameSeconds: gameStatus.get_time())
        LBL_score.text = String(gameStatus.get_moves())
        scoresLogic()
    }
    
    func scoresLogic(){
        allScores = Storage.fetch()
        if(allScores.isEmpty){
            allScores.append(myScore)
            Storage.save(scoreDetails: allScores)
            return
        }
        if(allScores.count <= 10){
            insertToScores()
        }
        if(allScores.count > 10){
            allScores.remove(at: allScores.count - 1)
        }
        Storage.save(scoreDetails: allScores)
    }
        
    func insertToScores(){
        for i in  0 ..< allScores.count {
            if(myScore.compareTo(otherScore: allScores[i])){
                allScores.insert(myScore, at: i)
                return
            }
        }
        allScores.insert(myScore, at: allScores.count)
    }
    
    @IBAction func onRestart(_ sender: UIButton) {
        self.performSegue(withIdentifier: "RestartTransition", sender: self)
    }
    
    
    @IBAction func onMenu(_ sender: UIButton) {
        self.performSegue(withIdentifier: "MenuTransition", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "RestartTransition"){
            let vc = segue.destination as! PlayController
            vc.gameStatus = gameStatus
        } else if(segue.identifier == "MenuTransition"){
            
        }
        
    }
    
}
