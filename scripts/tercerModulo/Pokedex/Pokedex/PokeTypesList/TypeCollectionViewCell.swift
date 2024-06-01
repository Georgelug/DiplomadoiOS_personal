//
//  TypeCollectionViewCell.swift
//  Pokedex
//
//  Created by Diplomado on 31/05/24.
//

import UIKit

class TypeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var pokeType : PokeType = .agua
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(pokeType : PokeType){
        name.text = pokeType.name
        image.image = UIImage(named: pokeType.image)
    }

}
