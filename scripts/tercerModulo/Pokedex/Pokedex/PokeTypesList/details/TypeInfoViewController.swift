//
//  TypeInfoViewController.swift
//  Pokedex
//
//  Created by Diplomado on 31/05/24.
//

import UIKit

class TypeInfoViewController: UIViewController {

    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var pokeType : PokeType = .agua
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetail()
        // Do any additional setup after loading the view.
    }

    func setDetail(){
        info.text = "Information: \(pokeType.description)"
        image.image = UIImage(named: pokeType.image)
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
