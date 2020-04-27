//
//  OpenViewController.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 4/27/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import UIKit

class OpenViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func letsGoButton(_ sender: Any) {
        performSegue(withIdentifier: "gameTransition", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
