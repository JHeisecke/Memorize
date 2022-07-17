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

            GameView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
