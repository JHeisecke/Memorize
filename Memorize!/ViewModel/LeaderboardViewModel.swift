//
//  LeaderboardViewModel.swift
//  Memorize!
//
//  Created by Javier Heisecke on 2022-07-17.
//

import Foundation

class LeaderboardViewModel: ObservableObject {
    
    @Published private var model: Leaderboard?
    
    private let leaderboardRepository = LeaderboardRepository()
    
    //MARK: - Intent(s)
    func fetchLeaderboard() {
        leaderboardRepository.fetch { [weak self] response in
            self?.model = response
        }
    }
    
    func getLeaderboard(by theme: String) -> Leaderboard? {
        guard let leaderboard = model?.filter({ $0.theme == theme }) else { return nil }
        return leaderboard.sorted(by: { $0.score > $1.score })
    }
}
