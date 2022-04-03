//
//  ShortViewController.swift
//  Memorize!
//
//  Created by Javier Heisecke on 2022-04-02.
//

import UIKit
import GameKit

class ShortViewController: UIViewController, GKLocalPlayerListener {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GKLocalPlayer.local.authenticateHandler = { [self] gcAuthVC, error in
            if GKLocalPlayer.local.isAuthenticated {
                GKLocalPlayer.local.register(self)
                print("Authenticated to Game Center!")
            } else if let vc = gcAuthVC {
                self.present(vc, animated: true)
            }
            else {
                print("Error authentication to GameCenter: " + "\(error?.localizedDescription ?? "none")")
            }
        }
    }
}
