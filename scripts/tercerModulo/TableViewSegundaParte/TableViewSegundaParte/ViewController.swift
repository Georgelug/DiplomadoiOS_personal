//
//  ViewController.swift
//  TableViewSegundaParte
//
//  Created by Diplomado on 24/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchArray : [String] = []
    var searching = false
    
    var array = [
        "Juan",
        "María",
        "Carlos",
        "Ana",
        "Luis",
        "Carmen",
        "Pedro",
        "Laura",
        "José",
        "Marta"
    ]


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }

    
    @IBAction func editTable(_ sender: Any) {
        if tableView.isEditing {
            tableView.isEditing = false
        }else{
            tableView.isEditing = true
        }
    }
}


extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        !searching ? array.count : searchArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = !searching ? array[indexPath.row] : searchArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        if !searching{
            array.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        }else{
            searchArray.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        }
        
    }
    
}


extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchArray = array.filter{$0.prefix(searchText.count) == searchText}
        searching = true
        print(searchArray)
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
    }
}

