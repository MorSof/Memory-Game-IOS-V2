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
    @IBOutlet weak var movesLabel: UILabel!
    var cardArray = [Card]()
    var dict = [UIImageView: Card]()
    var cardIndex = 0
    var num_of_moves: Int = 0
    var timer:Timer?
    var actualTime:Float = 0
    var firstFlippedCard:UIImageView?
    var secondFlippedCard:UIImageView?
    var isWon = true
    var gameStatus: GameStatus!
    
    override func viewDidAppear(_ animated: Bool) {
        SoundManager.playSound(.shuffle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardArray = CardModel(numOfCards: gameStatus.get_num_of_cards()).getCards()
        addingCardRows()
        movesLabel.text = "Moves: \(num_of_moves)"
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerRuninng), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    @objc func timerRuninng() {
        actualTime += 1
        timerLabel.text = String(format: "Time: %.2f", actualTime/1000)
        
//        if actualTime <= 0 {
//            timer?.invalidate()
//            timerLabel.textColor = UIColor.red
//            checkGameOver()
//        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        gameLogic(tappedImage)
    }
    
    func gameLogic(_ tappedImage: UIImageView) {
        
        if actualTime <= 0 {//when time is up stop logic
            return
        }
        
        let card = dict[tappedImage]!
        let image : UIImage = UIImage(named: card.imageName )!
        
        if card.isFlipped == false && card.isMatch == false && secondFlippedCard == nil{
            
            card.isFlipped = true
            SoundManager.playSound(.flip)
            flipCard(tappedImage, image: image)
            if firstFlippedCard == nil {
                firstFlippedCard = tappedImage
            }else{
                tappedImage.image = image
                secondFlippedCard = tappedImage
                secondCardChosen(card, tappedImage)
                                
            }
        }
    }
    
    func secondCardChosen(_ card: Card, _ tappedImage: UIImageView) {
        num_of_moves += 1
        movesLabel.text = "Moves \(self.num_of_moves)"
        if isEqualCards() {
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
        if firstFlippedCard?.image == secondFlippedCard?.image {
            return true
        }
        return false
    }
    
    func whenEqualLogic() {
        SoundManager.playSound(.match)
        dict[firstFlippedCard!]?.isMatch = true
        dict[secondFlippedCard!]?.isMatch = true
        checkGameOver()
    }
    
    func whenNotEqualLogic() {
        let image : UIImage = UIImage(named:"back")!
        SoundManager.playSound(.nomatch)
        dict[firstFlippedCard!]?.isFlipped = false
        dict[secondFlippedCard!]?.isFlipped = false
        self.firstFlippedCard?.image = image
        self.secondFlippedCard?.image = image
    }
    
    func checkGameOver() {
        isWon = true
        for card in cardArray {
            if card.isMatch == false {
                isWon = false
                break
            }
        }
        if isWon == true{
            timer?.invalidate()
            performSegue(withIdentifier: "myScoreTransition", sender: self)
        }
        return
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "myScoreTransition"){
        let scoreViewController = segue.destination as! ScoreViewController
//        if isWon {
//            vc.titleName = "Game Over You Won!"
//        }else {
//            vc.titleName = "Game Over You Lost!"
//        }
        scoreViewController.actualTime = Int(actualTime)
        scoreViewController.num_of_moves = num_of_moves
//        scoreViewController.lastGameNumOfRows = numOfRows
//        scoreViewController.lastGameNumOfCardsPerRow = numOfCardsPerRow
//        scoreViewController.userHighScore = HighScore(name: name, time: timePassed, location: myLocation,date: Date())
        }
    }
    
    
    func addingCardRows(){
        for _ in 0..<gameStatus.get_num_of_rows() {
        allCardsStack.addArrangedSubview(generateHorizontalStackView())
        }
    }
    
    func generateHorizontalStackView() -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        for _ in 0..<gameStatus.get_num_of_cols() {
            stackView.addArrangedSubview(generateImageView())
        }
        return stackView
    }
    
   func generateImageView() -> UIImageView{
        let image : UIImage = UIImage(named:"back")!
        let imageView = UIImageView(image: image)
        dict[imageView] = cardArray[cardIndex]
        cardIndex += 1
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        return imageView
    }
    
    func flipCard(_ tappedImage: UIImageView, image : UIImage) {
        UIView.transition(with: tappedImage, duration: 0.3, options: .transitionFlipFromRight, animations:{
                           tappedImage.image = image
            })
    }


}

