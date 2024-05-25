//
//  TableViewCell.swift
//  Nesflis
//
//  Created by Diplomado on 25/05/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies : [Movie] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        collectionView.delegate = self
        var layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
    }


}

extension TableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            
        cell.configMovie(movie: movies[indexPath.row])
        //collectionView.reloadData()
        return cell
        
    }
    
    
}


extension TableViewCell: UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 300, height: 450)
    }
}

