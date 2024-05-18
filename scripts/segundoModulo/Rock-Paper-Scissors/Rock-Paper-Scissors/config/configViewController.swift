//
//  configViewController.swift
//  Rock-Paper-Scissors
//
//  Created by Diplomado on 04/05/24.
//

import UIKit

class configViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    
    
    @IBOutlet weak var win: UITextField!
    
    @IBOutlet weak var lose: UITextField!
    
    @IBOutlet weak var reqScore: UITextField!
    
    @IBOutlet weak var rounds: UISlider!
    
    @IBOutlet weak var pointsView: UIStackView!
    @IBOutlet weak var roundsView: UIView!
    
    private var gameMode: Int!
    
    private var gameViews: [String] = [
        "GameViewController",
        "GameView2ViewController"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showData()
    }
    
   
    @IBAction func gameMode(_ sender: Any) {
        guard let action = sender as? UISegmentedControl else { return }
        
        switch action.selectedSegmentIndex {
        case 0:
            print("Rounds")
            pointsView.isHidden = true
            roundsView.isHidden = false
        case 1:
            print("Points")
            pointsView.isHidden = false
            roundsView.isHidden = true
        default:
            print("What?!!")
        }
        gameMode = action.selectedSegmentIndex
    }
    
    @IBAction func start(_ sender: Any) {
        guard let name = name.text else { return }
        
        if(!name.isEmpty){
            present(GameViewController(), animated: true)
        }
        
        
    }
    
    private func showData(){
        print("\(win.text ?? "") \(lose.text ?? "") \(reqScore.text ?? "")")
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
