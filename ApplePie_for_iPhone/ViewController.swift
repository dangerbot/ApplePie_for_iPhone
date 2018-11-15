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
    var totalWins = 0
    var totalLosses = 0
    var currentGame: Game!
    
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
    }
    
    func newRound() {
        os_log("ViewController. newRound()", log: OSLog.default, type: .info)
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: numOfIncorrectMovesAllowed)
        print("Word: \(currentGame.word) :: movesRemaining: \(currentGame.incorrectMovesRemaining)")
        updateUI()
    } // END newRound()
    
    func updateUI() {
        os_log("ViewController. updateUI()", log: OSLog.default, type: .info)
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        print("Wins: \(totalWins), Losses: \(totalLosses), Image: Tree \(currentGame.incorrectMovesRemaining).pdf")
    } // END updateUI()

}

