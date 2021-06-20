//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
       
        var firstPlayer = players.first
        var minValue = Value.ace.rawValue
        
        for player in players  {
            for card in player.hand! {
                if card.isTrump && card.value.rawValue <= minValue {
                    firstPlayer = player
                    minValue = card.value.rawValue
                }
            }
        }
        
        return firstPlayer
    }
    
}
