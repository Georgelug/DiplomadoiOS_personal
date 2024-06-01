//
//  PokeListViewController.swift
//  Pokedex
//
//  Created by Diplomado on 31/05/24.
//

import UIKit

class PokeListViewController: UIViewController {
    
    let pokeModel = PokeModel()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PokeListTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        //tableView.rowHeight = 500
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

extension PokeListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokeModel.getSizePokemonesList()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? PokeListTableViewCell
        
        let aux = pokeModel.getPokemonFromPokemonesList(indexPath: indexPath)
        
        cell?.pokemon = aux
        cell?.configCell(pokemon: aux)
        
        return cell!
       
    }
    
    
    
}

extension PokeListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detail.pokemon = pokeModel.getPokemonFromPokemonesList(indexPath: indexPath)
        
        self.present(detail, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pokeModel.setPokeToFavs(indexPath: indexPath)
            print(pokeModel.pokemones)
        }
    }
    
}
