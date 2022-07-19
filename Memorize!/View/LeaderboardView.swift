//
//  LeaderBoardView.swift
//  Memorize!
//
//  Created by Javier Heisecke on 2022-07-17.
//

import SwiftUI

struct LeaderboardView: View {
    
    @ObservedObject var viewModel: LeaderboardViewModel
    
    init(viewModel: LeaderboardViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(DeckThemes.allOptions, id: \.self) { theme in
                    Section(header: Text(theme.localizedName)) {
                        if let leaderboard = viewModel.getLeaderboard(by: theme.name), !leaderboard.isEmpty {
                            LeaderboardScoreView(scores: leaderboard, theme: theme)
                        } else {
                            Text("No scores yet! be the first one.")
                        }
                    }
                    .headerProminence(.increased)
                }
            }
            .navigationBarTitle("Leaderboard")
        }
        .padding(.top)
        .refreshable {
            self.viewModel.fetchLeaderboard()
        }
        .onAppear {
            self.viewModel.fetchLeaderboard()
        }
    }
    
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(viewModel: LeaderboardViewModel())
    }
}


struct LeaderboardScoreView: View {
    var theme: DeckThemes
    var scores: Leaderboard
    
    init(scores: Leaderboard, theme: DeckThemes) {
        self.scores = scores
        self.theme = theme
    }
    
    var body: some View {
        ForEach(scores, id: \.self) { score in
            HStack {
                Text(score.username)
                Spacer()
                Text(String(format:"%.1f", score.score))
            }
        }
    }
}
