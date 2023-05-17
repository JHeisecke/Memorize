//
//  MemoryGameViewModel.swift
//  MemoryGame
//
//  Created by Javier Heisecke on 2022-02-06.
//

import Foundation
import SwiftUI

class MemoryGameViewModel: ObservableObject {
    
    @Published private var model: MemoryGame<String>
    var theme: DeckThemes
    
    private let leaderBoardRepository = LeaderboardRepository()
    
    init(theme: DeckThemes) {
        model = MemoryGameViewModel.createMemoryGame(with: theme)
        self.theme = theme
    }
    
    private static func createMemoryGame(with theme: DeckThemes) -> MemoryGame<String> {
        MemoryGame<String>(theme: theme) { pairIndex, theme in
            theme.deck[pairIndex]
        }
    }
    
    var cards: [Card] {
        return model.cards
    }
    
    var score: String {
        String(format:"%.1f", model.score)
    }
    
    var name: String {
        return model.localizedName
    }
    
    var color: Int {
        return model.color
    }
    
    var allCardsMatched: Bool {
        return model.matchedCards == cards.count
    }
    
    //MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model.name = ""
        model.color = 0
        model = MemoryGameViewModel.createMemoryGame(with: theme)
    }
    
    func saveScore(with username: String) {
        guard !username.isEmpty else { return }
        leaderBoardRepository.save(score: Score(username: username, score: model.score, isHighScore: false, theme: model.name))
    }
}
