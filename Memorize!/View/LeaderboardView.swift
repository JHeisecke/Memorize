//
//  LeaderBoardView.swift
//  Memorize!
//
//  Created by Javier Heisecke on 2022-07-17.
//

import SwiftUI

struct LeaderboardView: View {
    
    @ObservedObject var viewModel: LeaderboardViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(DeckThemes.allOptions, id: \.self) { theme in
                    Section(header: Text(theme.name)) {
                        HStack {
                            Text("Jimmy")
                            Spacer()
                            Text("29.948")
                        }
                        HStack {
                            Text("Johnny")
                            Spacer()
                            Text("299.348")
                        }
                        HStack {
                            Text("JuanJo")
                            Spacer()
                            Text("299")
                        }
                    }
                    .headerProminence(.increased)
                }
            }
            .navigationBarTitle("Leaderboard")
        }
        .padding(.top)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(viewModel: LeaderboardViewModel())
    }
}
