//
//  CheckOutViewController.swift
//  ShoppingAPP
//
//  Created by Diplomado on 13/04/24.
//

import UIKit

class CheckOutViewController: UIViewController {
    
    var shopppingCart: [String] = []
    @IBOutlet weak var checkoutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(shopppingCart)
        creatLabelWithName()
        // Do any additional setup after loading the view.
    }
    
    func creatLabelWithName(){
        checkoutLabel.text = shopppingCart.joined(separator: " ")
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
