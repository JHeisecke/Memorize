//
//  LeaderboardRepository.swift
//  Memorize!
//
//  Created by Javier Heisecke on 2022-07-18.
//

import Foundation
import FirebaseFirestore

protocol LeaderboardRepositoryProtocol {
    func save(score: Score)
    func fetch()
}

struct LeaderboardRepository: LeaderboardRepositoryProtocol {
    
    private let database = FirebaseFirestore.Firestore.firestore()
    
    func save(score: Score) {
        database
            .collection("leaderboard")
            .addDocument(data: [
                            "id": score.id,
                            "isHighScore": false,
                            "score": score.score,
                            "theme": score.theme,
                            "username": score.username
            ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
    }
    
    func fetch() {
        database.collection("leaderboard").getDocuments { snapshot, error in
            guard let data = snapshot?.documents, error == nil else {
                return
            }
            
            print(data)
        }
    }
}
