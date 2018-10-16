//
//  Rules.swift
//  DeckGames
//
//  Created by Christian Riboldi on 8/10/18.
//  Copyright © 2018 Christian Riboldi. All rights reserved.
//

import Foundation

protocol Rules {
    var startingHandSize: Int { get set }
    var maxHandSize: Int { get set }
    var winCondition: Bool { get }
}
