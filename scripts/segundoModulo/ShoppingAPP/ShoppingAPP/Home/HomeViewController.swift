//
//  HomeViewController.swift
//  ShoppingAPP
//
//  Created by Diplomado on 13/04/24.
//

import UIKit

enum ShoppingItems{
    case carrot
    case onion
    case eggplant
    case garlic
    case broccoli
    case lettuce
    case tomato
    case avocato
    case cucumber
    case chilli
}

class HomeViewController: UIViewController {
    private var shoppingCart: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func itemBtn(_ sender : Any){
        guard let button = sender as? UIButton else { return }
        
        print(button.tag)
        print(button.titleLabel?.text ?? "")
        if let btnTitle = button.titleLabel?.text{
            addElementToShoppingCart(item: btnTitle)
        }
        modifyButtonAfterPressed(for: button)
    }
    
    @IBAction func checkOut(_ sender: Any){
        print(shoppingCart)
        let checkoutViewController = CheckOutViewController(nibName: "CheckOutViewController", bundle: nil)
        checkoutViewController.shopppingCart = shoppingCart
        self.navigationController?.pushViewController(checkoutViewController, animated: true)
    }

    func addElementToShoppingCart(item: String){
        shoppingCart.append(item)
    }
    
    func modifyButtonAfterPressed(for button: UIButton){
        button.tintColor = .green
        button.setTitle("✔" + (button.titleLabel?.text?.dropFirst() ?? ""), for: .normal)
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
