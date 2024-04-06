//
//  ViewController.swift
//  RGBmixer
//
//  Created by Diplomado on 06/04/24.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var slideR: UISlider!
    @IBOutlet weak var labelR: UILabel!
    
    @IBOutlet weak var slideG: UISlider!
    @IBOutlet weak var labelG: UILabel!
    
    @IBOutlet weak var slideB: UISlider!
    @IBOutlet weak var labelB: UILabel!
    
    private var color = UIColor(red:0, green: 0,blue: 0,alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetRangesOfSliders()
        resetValuesOfLabels()
        view.backgroundColor = getColor()
    }
    
    @IBAction func setLabelsAndBackGround(){
        labelR.text = String(slideR.value)
        labelG.text = String(slideG.value)
        labelB.text = String(slideB.value)
        
    }
    
    @IBAction func setBackGround(){
        view.backgroundColor = getColor()
    }
    
    private func resetRangesOfSliders(){
        [slideR, slideG, slideB].forEach{
            $0?.minimumValue = 0.0
            $0?.maximumValue = 1.0
        }
    }
    
    private func resetValuesOfLabels(){
        [labelR, labelG, labelB].forEach{
            $0?.text = "0"
        }
    }
    
    private func getColor() -> UIColor{
        UIColor(
            red: CGFloat(slideR.value),
            green: CGFloat(slideG.value),
            blue: CGFloat(slideB.value),
            alpha: 1.0
        )
    }
    
}



