//
//  Card.swift
//  Concentration
//
//  Created by Jason W Grzywna on 12/14/17.
//  Copyright © 2017 com.learning.jwg. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1             //Could drop the "Card." since identifier is local
        return Card.identifierFactory
    }
    
    init() {             //External name and external name is the same, INIT methods tend to have same external and internal names
        self.identifier = Card.getUniqueIdentifier()      //Use self. to signal the local var vs the passed in var
    }
}
