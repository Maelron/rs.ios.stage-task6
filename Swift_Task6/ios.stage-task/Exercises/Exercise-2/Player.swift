//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        
        if let cards = hand {
            for playerCard in cards {
                if playerCard.value == card.value {
                    return true
                }
            }
        }
        
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        
        if let cards = hand {
            for playerCard in cards {
                for card1 in table.keys {
                    for card2 in table.values {
                        if playerCard.value.rawValue == card1.value.rawValue || playerCard.value.rawValue == card2.value.rawValue {
                            return true
                        }
                    }
                }
            }
        }
        
        return false
    }
}
