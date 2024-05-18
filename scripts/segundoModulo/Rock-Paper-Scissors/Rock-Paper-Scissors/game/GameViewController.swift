//
//  GameViewController.swift
//  Rock-Paper-Scissors
//
//  Created by Diplomado on 04/05/24.
//

import UIKit

enum element {
case rock
case paper
case scissors
}

class GameViewController: UIViewController {

    @IBOutlet weak var computer: UILabel!
    
    @IBOutlet weak var status: UILabel!
    
    
    private var selection: element = .paper
    private var computerSelection: element = .paper


    private func setComputerLabel(){
        let emojis = ["👊🏻","✌🏻","🖐🏻"]
        let selections:[element] = [.paper,.rock,.scissors]
        let index : Int = [0,1,2].randomElement()!
        computer.text = emojis[index]
        computerSelection = selections[index]
    }
    
    private func getWiner2(){
        if(computerSelection == selection){
            status.text = "Tie"
        }else{
            switch selection {
            case .paper:
                if(computerSelection == .scissors){
                    status.text = "Computer wins"
                }else{
                    status.text = "User wins"
                }
            case .rock:
                if(computerSelection == .paper){
                    status.text = "Computer wins"
                }else{
                    status.text = "User wins"
                }
            case .scissors:
                if(computerSelection == .rock){
                    status.text = "Computer wins"
                }else{
                    status.text = "User wins"
                }
            }
        }
    }
    
    private func getWiner(){
        switch (selection, computerSelection) {
        case (.paper, .paper):
            status.text = "Tie"
        case (.paper, .scissors):
            status.text = "Computer wins"
        case (.paper, .rock):
            status.text = "User wins"
        case (.rock, .rock):
            status.text = "Tie"
        case (.rock, .paper):
            status.text = "Computer wins"
        case (.rock, .scissors):
            status.text = "User wins"
        case (.scissors, .scissors):
            status.text = "Tie"
        case (.scissors, .rock):
            status.text = "Computer wins"
        case (.scissors, .paper):
            status.text = "User wins"
        }
    }
    
    @IBAction func rock(_ sender: Any) {
        
        selection = .rock
        setComputerLabel()
        
        getWiner()
    }
    
    @IBAction func scissors(_ sender: Any) {
        
        selection = .scissors
        setComputerLabel()
        getWiner()
    }
    
    
    @IBAction func paper(_ sender: Any) {
        
        selection = .paper
        setComputerLabel()
        getWiner()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
