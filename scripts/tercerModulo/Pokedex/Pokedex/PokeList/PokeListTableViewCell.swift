//
//  PokeListTableViewCell.swift
//  Pokedex
//
//  Created by Diplomado on 31/05/24.
//

import UIKit

class PokeListTableViewCell: UITableViewCell {

    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeNumber: UILabel!
    
    var pokemon = Pokemon(name: "", type: .agua, weaknesses: [.fuego], image: "", description: "", number: 0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(pokemon : Pokemon){
        pokeName.text = pokemon.name
        pokeNumber.text = String(pokemon.number)
    }
    
}
