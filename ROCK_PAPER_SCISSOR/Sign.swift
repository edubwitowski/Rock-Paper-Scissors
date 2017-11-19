//
//  Sign.swift
//  ROCK_PAPER_SCISSOR
//
//  Created by Macbook on 11/15/17.
//  Copyright © 2017 Eric Witowski. All rights reserved.
//

import Foundation
import GameplayKit


let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let Sign = randomChoice.nextInt()
    if Sign == 0 {
        return .rock
    } else if Sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch Self {
        case .rock:
            return " 👊 "
        case .paper:
            return " ✋️ "
        case .scissors:
            return " ✌️ "
        }
    }



func takeTurn(_ opponent: Sign) -> GameState {
    switch self  {
    case .rock:
        switch  opponent {
        case .rock:
            return GameState.draw
        case .paper:
            return GameState.lose
        case .scissors:
            return GameState.win
    }
    case .paper: 
        switch  opponent {
        case .rock:
            return GameState.win
        case .paper:
            return GameState.draw
        case .scissors:
            return GameState.lose
        }
    case .scissors:
    switch  opponent {
    case .rock:
    return GameState.lose
    case .paper:
    return GameState.win
    case .scissors:
    return GameState.draw
    }
    
    }
}
}
