//
//  Concentration.swift
//  Concentration
//
//  Created by Jason W Grzywna on 12/14/17.
//  Copyright © 2017 com.learning.jwg. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCardFlipOnly(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        // FOR loop in Swift, over any sequence, this on is a "countable range"
        for _ in 1...numberOfPairsOfCards {
            let card =  Card() //Creates a card
            cards.append(card)                       //Creates a copy of card
            cards.append(card)                       //Create a copy of card again
            //or
            //cards += [card,card]
        }
        // TODO: Shuffle the cards
    }
}
