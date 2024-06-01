//
//  PokeFavsViewController.swift
//  Pokedex
//
//  Created by Diplomado on 31/05/24.
//

import UIKit

class PokeFavsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let pokeModel = PokeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPokeModel()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PokeListTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
    }
    
    func setPokeModel(){
        pokeModel.pokemones = pokeModel.getPokeFavs()
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

extension PokeFavsViewController: UITableViewDataSource{
    
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

extension PokeFavsViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detail.pokemon = pokeModel.getPokemonFromPokemonesList(indexPath: indexPath)
        
        self.present(detail, animated: true)
        
    }
    
}

