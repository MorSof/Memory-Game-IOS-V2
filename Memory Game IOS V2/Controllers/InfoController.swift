//
//  OpenViewController.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 4/27/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import UIKit

class InfoController: UIViewController {
    
    @IBOutlet weak var BTN_lets_go: UIButton!
    @IBOutlet weak var TXT_name: UITextField!
    var gameStatus: GameStatus!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func letsGoButton(_ sender: Any) {
        if TXT_name.text == "" {
            gameStatus.set_name(name: "Player")
        }else{
            gameStatus.set_name(name: TXT_name.text)
        }
        performSegue(withIdentifier: "gameTransition", sender: self)
    }
    
    @IBAction func BTN_return(_ sender: UIButton) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "gameTransition"){
            let vc = segue.destination as! PlayController
            if(gameStatus.get_level() == "Easy"){
                gameStatus.set_num_of_cards(num_of_cards: 12)
                gameStatus.set_num_of_rows(num_of_rows: 3)
                gameStatus.set_num_of_cols(num_of_cols: 4)
            } else if (gameStatus.get_level() == "Hard"){
                gameStatus.set_num_of_cards(num_of_cards: 16)
                gameStatus.set_num_of_rows(num_of_rows: 4)
                gameStatus.set_num_of_cols(num_of_cols: 4)
            }
            vc.gameStatus = gameStatus
    
        }
    }
}
