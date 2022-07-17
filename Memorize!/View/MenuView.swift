//
//  MenuView.swift
//  MemoryGame
//
//  Created by Javier Heisecke on 2022-03-19.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(DeckThemes.allOptions, id: \.self) { theme in
                    NavigationLink(destination:
                                    MemoryGameView(viewModel: MemoryGameViewModel(theme: theme)))
                    {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(theme.name)
                                .font(.headline)
                                .foregroundColor(Color(hex: theme.color))
                            Text(theme.deck.map({$0}).joined(separator: ""))
                                .font(.caption)
                        }
                    }
                }
            }
            .navigationBarTitle("Memorize!")
            .navigationBarItems(
                leading:
                    Button {
                        print("leaderboard")
                    } label: {
                        Image("leaderboard-icon")
                    },
                trailing:
                    Button {
                        print("leaderboard")
                    } label: {
                    Image(systemName: "questionmark.circle")
                    }
            )
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
