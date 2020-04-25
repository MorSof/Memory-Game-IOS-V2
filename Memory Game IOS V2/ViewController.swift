//
//  ViewController.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 4/25/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var allCardsStack: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addingRows()
        
    }
    
    func addingRows(){
        
        for i in 0...4 {
            allCardsStack.addArrangedSubview(generateHorizontalStackView())
        }
        
    }
    
    func generateHorizontalStackView() -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
    stackView.translatesAutoresizingMaskIntoConstraints = false
                
        return stackView

    }


}

