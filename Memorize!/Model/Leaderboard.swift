//
//  Leaderboard.swift
//  Memorize!
//
//  Created by Javier Heisecke on 2022-07-17.
//

import Foundation

struct Leaderboard {
    var scores: [Score]
}

struct Score {
    var id: String
    var username: String
    var score: Double
    var isHighScore: Bool
    var theme: String
}
