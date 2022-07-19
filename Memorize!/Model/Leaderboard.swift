//
//  Leaderboard.swift
//  Memorize!
//
//  Created by Javier Heisecke on 2022-07-17.
//

import Foundation
import FirebaseFirestoreSwift

typealias Leaderboard = [Score]

struct Score: Codable, Hashable {
    @DocumentID var id: String?
    var username: String
    var score: Double
    var isHighScore: Bool
    var theme: String
}
