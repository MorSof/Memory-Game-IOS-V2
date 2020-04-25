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
    @IBOutlet weak var timerLabel: UILabel!
    var model = CardModel()
    var cardArray = [Card]()
    var dict = [UIImageView: Card]()
    var cardIndex = 0
    var timer:Timer?
    var actualTime:Float = 100000
    var firstFlippedCard:UIImageView?
    var secondFlippedCard:UIImageView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardArray = model.getCards()
        addingRows()
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerRuninng), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        
    }
    
    @objc func timerRuninng() {
        actualTime -= 1
        timerLabel.text = String(format: "Time Left: %.2f", actualTime/1000)
        
        if (actualTime <= 0) {
            timer?.invalidate()
            timerLabel.textColor = UIColor.red
            checkGameOver()
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        gameLogic(tappedImage)
    }
    
    func gameLogic(_ tappedImage: UIImageView) {
        
        if actualTime <= 0 {//when time is up stop logic
            return
        }
        
        let card = dict[tappedImage]!
        let image : UIImage = UIImage(named: card.imageName )!
        
        if(card.isFlipped == false && card.isMatch == false && secondFlippedCard == nil){
            
            print(card.imageName)
            card.isFlipped = true
//            SoundManager.playSound(.flip)

            if(firstFlippedCard == nil){
                tappedImage.image = image
                firstFlippedCard = tappedImage
            }else{
                tappedImage.image = image
                secondFlippedCard = tappedImage
               
                secondCardChosen(card, tappedImage)
                
                
            }
        }
    }
    
    func secondCardChosen(_ card: Card, _ tappedImage: UIImageView) {
                
        if(isEqualCards()){
            whenEqualLogic()
            self.firstFlippedCard = nil
            self.secondFlippedCard = nil
        }else{
             DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.whenNotEqualLogic()
                self.firstFlippedCard = nil
                self.secondFlippedCard = nil
            }
        }
        
        
    }
    
    func isEqualCards() -> Bool {
        
        if(firstFlippedCard?.image == secondFlippedCard?.image){
            return true
        }

        return false
        
    }
    
    func whenEqualLogic() {
      
//        SoundManager.playSound(.match)
        dict[firstFlippedCard!]?.isMatch = true
        dict[secondFlippedCard!]?.isMatch = true
//        firstFlippedCardCell?.remove()
//        secondFlippedCardCell?.remove()
        print("yes!")

        checkGameOver()

    }
    
    func whenNotEqualLogic() {
        let image : UIImage = UIImage(named:"back")!
//        SoundManager.playSound(.nomatch)
        dict[firstFlippedCard!]?.isFlipped = false
        dict[secondFlippedCard!]?.isFlipped = false
        
            self.firstFlippedCard?.image = image
            self.secondFlippedCard?.image = image
        
       
        print("no!")
        
    }
    
    func checkGameOver() {
        
        var isWon = true
        
        for card in cardArray {
            
            if card.isMatch == false {
                isWon = false
                break
            }
            
        }
        
        let titel = "Game Over"
        var message = ""
        
        if isWon == true{
            if actualTime > 0 {
                timer?.invalidate()
            }
            message = "You Won"
        }
        else {
            if actualTime > 0 {
                return
            }
            message = "You Suck!"
        }
        
       showAlert(titel, message)
        
    }
    
    func showAlert( _ title:String, _ message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
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

