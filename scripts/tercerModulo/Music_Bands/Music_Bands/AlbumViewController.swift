//
//  AlbumViewController.swift
//  Music_Bands
//
//  Created by Diplomado on 18/05/24.
//

import UIKit

class AlbumViewController: UIViewController {
    var Model = AlbumViewModel(albums: [])
    var index = IndexPath()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let songsViewController = segue.destination as? SongViewController{
            songsViewController.Model.songs = Model.getSongsOfAlbum(index: index)
        }
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

extension AlbumViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Model.getCountArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        index = indexPath
        cell?.textLabel?.text = Model.getNameOfAlbum(index: indexPath)
        
        return cell!
    }
    
}


extension AlbumViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath
        print(index)
        
        performSegue(withIdentifier: "SongsSegue", sender: self)
    }
    
}
