//
//  TabView.swift
//  Memorize!
//
//  Created by Javier Heisecke on 2022-04-03.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            LeaderboardView(viewModel: LeaderboardViewModel())
                .tabItem {
                    Image("leaderboard-icon")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
