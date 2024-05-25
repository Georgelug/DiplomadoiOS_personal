//
//  CollectionViewCell.swift
//  Nesflis
//
//  Created by Diplomado on 25/05/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configMovie(movie : Movie){
        title.text = movie.name
        image.image = UIImage(named: movie.imageName)
    }

}


