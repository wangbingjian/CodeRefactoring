//
//  File.swift
//  CodeRefatoring
//
//  Created by hatsune miku on 2024/6/19.
//

import Foundation

protocol Copying {
    func copy() -> Self
}

struct Play: Copying {
    var playID: String
    var name: String
    var type: String
    
    func copy() -> Play {
        return Play(playID: playID, name: name, type: type)
    }
}

struct Show: Copying {
    var playID: String
    var audience: Int
    var amount = 0
    var volumeCredicts = 0
    var play: Play?
    
    func copy() -> Show {
        if let play = play {
            return Show(playID: playID, audience: audience, amount: amount, volumeCredicts: volumeCredicts, play: play)
        }
        return Show(playID: playID, audience: audience, amount: amount, volumeCredicts: volumeCredicts)
    }
}

struct Invoice {
    var customer: String
    var performances: [Show]
}

class Statement {
    var customer: String = ""
    var performances: [Show] = []
    var totalAmount = 0
    var totalCredicts = 0
}
