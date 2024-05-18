//
//  ViewController.swift
//  Music_Bands
//
//  Created by Diplomado on 18/05/24.
//

import UIKit

class ViewController: UIViewController {
    var Model = BandViewModel()
    var index = IndexPath()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let albumViewController = segue.destination as? AlbumViewController{
            albumViewController.Model.albums = Model.getAlbumsOfBand(index: index)
        }
    }

}


extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Model.getCountArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        index = indexPath
        cell?.textLabel?.text = Model.getNameOfBand(index: indexPath)
        
        return cell!
    }
    
}


extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath
        print(index)
        
        performSegue(withIdentifier: "AlbumSegue", sender: self)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        
//        if let albumViewController = storyboard.instantiateViewController(withIdentifier: "AlbumView") as? AlbumViewController {
//            albumViewController.Model = AlbumViewModel(albums: Model.getAlbumsOfBand(index: indexPath))
//            navigationController?.pushViewController(albumViewController, animated: true)
//        }
        
    }
    
}
