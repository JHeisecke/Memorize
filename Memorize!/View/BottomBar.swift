//
//  BottomBar.swift
//  Memorize!
//
//  Created by Javier Heisecke on 2022-04-03.
//

import SwiftUI

struct BottomBar: View {
    var body: some View {
        HStack {
            Spacer()
            Button {
                print("leaderboard")
            } label: {
                Image("leaderboard-icon")
            }
            Spacer()
            Button {
                print("leaderboard")
            } label: {
                Image(systemName: "questionmark.circle")
            }
            Spacer()
        }
        .padding()
        .padding(.horizontal)
        .background(
            Color.gray
                .clipShape(
                    RoundedRectangle(cornerRadius:20).stroke().background())
                
        )
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
