//
//  GameView.swift
//  Memorize!
//
//  Created by Javier Heisecke on 2022-04-02.
//

import SwiftUI

struct GameView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // later
    }
    func makeUIViewController(context: Context) -> UIViewController {
        let gameOn = ShortViewController()
        return gameOn
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
