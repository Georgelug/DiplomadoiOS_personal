//
//  TabBarController.swift
//  TabBarProgramatico
//
//  Created by Diplomado on 31/05/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    let first = FirstViewController()
    let second = SecondViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers([first, second], animated: true)
        tabBar.backgroundColor = .green
        tabBar.tintColor = .white
        
        // Do any additional setup after loading the view.
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
