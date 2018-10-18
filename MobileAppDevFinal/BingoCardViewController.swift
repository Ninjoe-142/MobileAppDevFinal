//
//  BingoCardViewController.swift
//  MobileAppDevFinal
//
//  Created by Joseph DeCrisanti on 10/15/18.
//  Copyright © 2018 Joseph DeCrisanti. All rights reserved.
//

import UIKit

class BingoCardViewController: UIViewController {

    @IBOutlet weak var B1Button: UIButton!
    @IBOutlet weak var B2Button: UIButton!
    @IBOutlet weak var B3Button: UIButton!
    @IBOutlet weak var B4Button: UIButton!
    @IBOutlet weak var B5Button: UIButton!
    
    
    
    var ButtonRow : [UIButton] = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberGenerator()
        
      
        // Do any additional setup after loading the view.
    }
    
    func numberGenerator(){
        self.ButtonRow = [self.B1Button, self.B2Button, self.B3Button, self.B4Button, self.B5Button]
        
        var bNumbers = [1,2,3,4,5,6,7,8,9,10,12,13,14,15]
        
        for button in ButtonRow{
            
            let pickedNumber = Int.random(in: 0...bNumbers.count)
            let number = bNumbers[pickedNumber]
            bNumbers.remove(at: pickedNumber)
            
            button.setTitle("\(number)", for: .normal)
        }
    }
}
