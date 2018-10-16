//
//  Deck.swift
//  DeckGames
//
//  Created by Christian Riboldi on 8/10/18.
//  Copyright © 2018 Christian Riboldi. All rights reserved.
//

import Foundation

protocol Deck {
    var cards: [Card] { get set }
    var remainingCards: Int { get }
    var dealtIndex: Int { get set }
    func shuffle()
    func dealCard() -> Card
    func dealHand(num: Int) -> [Card]
}
