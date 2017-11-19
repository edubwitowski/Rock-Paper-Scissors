//
//  ViewController.swift
//  ROCK_PAPER_SCISSOR
//
//  Created by Macbook on 11/15/17.
//  Copyright © 2017 Eric Witowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetBoard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var currentRPScissorsIndex = 0
    let RPScissorsList = ["Rock", "Paper", "Scissors"]
    
    func updateRPS() {
        statusLabel.text = "?"
        let RPScissorsName = RPScissorsList[currentRPScissorsIndex]
    }
    
    
    func resetBoard() {
        computerLabel.text = " 🤖 "
        statusLabel.text = "Rock, Paper, Scissor?"
        rockButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isHidden = false
        paperButton.isEnabled = true
        scissorsButton.isHidden = false
        scissorsButton.isEnabled = true
        playAgainButton.isHidden = true
        }
    
    func play(_ playerTurn: Sign) {
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
    
        let opponent = randomSign()
        computerLabel.text = opponent.emoji
        
        let gameResult = playerTurn.takeTurn(opponent)
        
        switch gameResult {
        case .draw:
           statusLabel.text = "Its a draw."
        case .lose:
           statusLabel.text = "You Lose"
        case .win:
           statusLabel.text = "You Win!"
        case .start:
           statusLabel.text = "Rock, Paper, Scissors"
        }
        
        
        switch playerTurn {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
            
        }
        playAgainButton.isHidden = false
    }
   
        switch playerTurn {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .hand:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
            playAgainButton.isHidden = false
    }
   
    @IBAction func playAgainSelected(_ sender: Any) {
        resetBoard()
    }
    
    @IBAction func rockSelected(_ sender: Any) {
        play(Sign.rock)
        
    }
    
    @IBAction func paperSelected(_ sender: Any) {
        play(Sign.paper)
    }
    
    @IBAction func scissorsButton(_ sender: Any){
        play(Sign.paper)
    }
    
   
    //Mark: End of Buttons
}

