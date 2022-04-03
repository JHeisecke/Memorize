//
//  MenuViewModel.swift
//  MemoryGame
//
//  Created by Javier Heisecke on 2022-03-19.
//
import GameKit

struct MenuViewModel {
    private var gcEnabled = Bool() // Check if the user has Game Center enabled
    private var gcDefaultLeaderBoard = String() // Check the default leaderboardID
    
    var gameCenterVC: UIViewController?
    
}
