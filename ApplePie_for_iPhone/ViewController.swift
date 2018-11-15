//
//  ViewController.swift
//  ApplePie_for_iPhone
//
//  Created by Steve on 11/14/18.
//  Copyright © 2018 SteveAndTheDogs. All rights reserved.
//

import UIKit
import os.log


class ViewController: UIViewController {
    
    var listOfWords = ["apple","orange","fart"]
    let numOfIncorrectMovesAllowed = 7
    var currentGame: Game!
    
    var totalWins = 0   { didSet {newRound() } }
    var totalLosses = 0 { didSet {newRound() } }

    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var gameWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        os_log("ViewController. viewDidLoad()", log: OSLog.default, type: .info)
        newRound()
    }

    
    @IBAction func letterButtonPressedAction(_ sender: UIButton) {
        os_log("ViewController. letterButtonPressedAction()", log: OSLog.default, type: .info)
        sender.isEnabled = false
        print(sender.isEnabled)
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        print(letter)
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func newRound() {
        os_log("ViewController. newRound()", log: OSLog.default, type: .info)
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: numOfIncorrectMovesAllowed, guessedLetters: [])
        print("Word: \(currentGame.word) :: movesRemaining: \(currentGame.incorrectMovesRemaining) :: guessed Letters: \(currentGame.guessedLetters)")
        updateUI()
    } // END newRound()
    
    func updateUI() {
        os_log("ViewController. updateUI()", log: OSLog.default, type: .info)
        gameWordLabel.text = currentGame.formattedWordforUI
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        print("Wins: \(totalWins), Losses: \(totalLosses), Image: Tree \(currentGame.incorrectMovesRemaining).pdf")
    } // END updateUI()
    
    func updateGameState() {
        os_log("ViewController. updateGameState()", log: OSLog.default, type: .info)
        if currentGame.incorrectMovesRemaining <= 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.gameInProgressWord {
            totalWins += 1
        } else {
            updateUI()
        }
    } // END updateGameState()

}

