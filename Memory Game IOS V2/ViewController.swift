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
    var model = CardModel()
    var cardArray = [Card]()
    var dict = [UIImageView: Card]()
    var cardIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardArray = model.getCards()
        addingRows()
        
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let image : UIImage = UIImage(named: dict[tappedImage]?.imageName ?? "")!
        tappedImage.image = image
    }
    
    func gameLogic(){
    }
    
    
    
    func addingRows(){
        
        for i in 0...3 {
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
        
        let image : UIImage = UIImage(named:"back")!

        for i in 0...2 {
            let imageView = UIImageView(image: image)
            dict[imageView] = cardArray[cardIndex]
            cardIndex+=1
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
            
            stackView.addArrangedSubview(imageView)
        }
        return stackView

    }

    
    

}

