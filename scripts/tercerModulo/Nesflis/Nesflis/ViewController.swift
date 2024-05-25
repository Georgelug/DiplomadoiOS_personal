//
//  ViewController.swift
//  Nesflis
//
//  Created by Diplomado on 25/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let model = MovieModel()
    let genres : [Genre] = [.adventure,.animated,.horror]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = 500
    }


}


extension ViewController: UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        genres.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        genres[section].toString
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
        
        cell?.movies = model.getArrayOfGenre(genre: genres[indexPath.section])
        
        return cell!
       
    }
    
    
    
}


