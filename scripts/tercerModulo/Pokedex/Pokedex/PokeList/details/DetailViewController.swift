//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Diplomado on 31/05/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var evolutionChain: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    var pokemon = Pokemon(name: "", type: .agua, weaknesses: [.fuego], image: "", description: "", number: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        // Do any additional setup after loading the view.
        setDetail()
    }

    
    func setDetail(){
        name.text = "Name: \(pokemon.name)"
        evolutionChain.text = "Chain Evolution: \(pokemon.chainEvolution)"
        info.text = "Information: \(pokemon.description)"
        number.text = "Number: \(pokemon.number)"
        image.image = UIImage(named: pokemon.image)
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
