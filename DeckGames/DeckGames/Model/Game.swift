//
//  Game.swift
//  DeckGames
//
//  Created by Christian Riboldi on 8/10/18.
//  Copyright © 2018 Christian Riboldi. All rights reserved.
//

import Foundation

protocol Game {
    func start()
    func stop()
    var deck: Deck { get set }
    var rules: Rules { get set }
    var hands: [Hand] { get set }
    var gameIsOver: Bool { get set }
    var winningPlayer: Int { get set }
}

extension Game {
    func start() {
        deck.shuffle()
        for (index, _) in hands.enumerated() {
//            self.hands[index].cards = deck.dealHand(num: rules.startingHandSize)
        }
    }
}
