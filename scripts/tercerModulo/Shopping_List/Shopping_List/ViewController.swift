//
//  ViewController.swift
//  Shopping_List
//
//  Created by Jorge Esparza on 20/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newItem: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var Model = ShopingViewModel()
    var index = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func addItem(_ sender: Any) {
        guard let _newItem = newItem.text else {
            showAlert(title: "Error", message: "The field of items is empty")
            return
        }
        
        guard _newItem.count > 0 else {
            showAlert(title: "Error", message: "The field of items is empty")
            return
        }
        
        Model.addItem(item: _newItem)
        let newIndexPath = IndexPath(row: Model.getCountArray() - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
        newItem.text = ""
    }
    
    func showAlert(title : String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Model.getCountArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        index = indexPath
        cell?.textLabel?.text = Model.getItemOfItems(index: indexPath)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            showAlert(title: "Warning", message: "Are you sure to delete this item? \(Model.getItemOfItems(index: indexPath))")
            // Eliminar el elemento del array de datos
            Model.deleteItem(at: indexPath)
            // Eliminar la fila de la tabla
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}


extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath
        print(index)
    }
    
}
