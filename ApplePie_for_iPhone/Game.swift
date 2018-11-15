//
//  Game.swift
//  ApplePie_for_iPhone
//
//  Created by Steve on 11/14/18.
//  Copyright © 2018 SteveAndTheDogs. All rights reserved.
//

import Foundation
import os.log

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character){
        os_log("Game. playerGuessed(...)", log: OSLog.default, type: .info)
        guessedLetters.append(letter)
        if word.characters.contains(letter) {
            print("Letter: \(letter) is a WINNER!")
        } else {
            incorrectMovesRemaining -= 1
            print("Letter: \(letter) is WRONG! you have \(incorrectMovesRemaining) moves remaining")
        }
    }
    
} // END Game
