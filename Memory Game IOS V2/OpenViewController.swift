//
//  OpenViewController.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 4/27/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import UIKit

class OpenViewController: UIViewController {

    var titleName = "Tropical Match Game"
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleName
    }
    
    @IBAction func letsGoButton(_ sender: Any) {
        performSegue(withIdentifier: "gameTransition", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
