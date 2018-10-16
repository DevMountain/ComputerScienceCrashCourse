//
//  Card.swift
//  DeckGames
//
//  Created by Christian Riboldi on 8/10/18.
//  Copyright © 2018 Christian Riboldi. All rights reserved.
//

import Foundation

protocol Card {
    var suit: Suit { get }
    var rank: Rank { get }
}
