//
//  BingoCardViewController.swift
//  MobileAppDevFinal
//
//  Created by Joseph DeCrisanti on 10/15/18.
//  Copyright © 2018 Joseph DeCrisanti. All rights reserved.
//

import UIKit
import Foundation

enum  WinConition{
    
    case vertical
    case horizontal
    case diagonal
}

class BingoCardViewController: UIViewController {

    @IBOutlet weak var B1Button: UIButton!
    @IBOutlet weak var B2Button: UIButton!
    @IBOutlet weak var B3Button: UIButton!
    @IBOutlet weak var B4Button: UIButton!
    @IBOutlet weak var B5Button: UIButton!
    
    @IBOutlet weak var I1Button: UIButton!
    @IBOutlet weak var I2Button: UIButton!
    @IBOutlet weak var I3Button: UIButton!
    @IBOutlet weak var I4Button: UIButton!
    @IBOutlet weak var I5Button: UIButton!
    
    @IBOutlet weak var N1Button: UIButton!
    @IBOutlet weak var N2Button: UIButton!
    @IBOutlet weak var freeButton: UIButton!
    @IBOutlet weak var N4Button: UIButton!
    @IBOutlet weak var N5Button: UIButton!
    
    @IBOutlet weak var G1Button: UIButton!
    @IBOutlet weak var G2Button: UIButton!
    @IBOutlet weak var G3Button: UIButton!
    @IBOutlet weak var G4Button: UIButton!
    @IBOutlet weak var G5Button: UIButton!
    
    @IBOutlet weak var O1Button: UIButton!
    @IBOutlet weak var O2Button: UIButton!
    @IBOutlet weak var O3Button: UIButton!
    @IBOutlet weak var O4Button: UIButton!
    @IBOutlet weak var O5Button: UIButton!
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if topLabel.text == sender.titleLabel?.text{
             sender.backgroundColor = UIColor.lightGray
        }
    }
    
    var bRow = [UIButton]()
    var iRow = [UIButton]()
    var nRow = [UIButton]()
    var gRow = [UIButton]()
    var oRow = [UIButton]()
    
    var bNumbers = [1,2,3,4,5,6,7,8,9,10,12,13,14,15]
    var iNumbers = [16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
    var nNumbers = [31,32,33,34,35,36,37,38,39,40,41,42,43,44,45]
    var gNumbers = [46,47,48,49,50,51,52,53,54,55,56,57,58,49,60]
    var oNumbers = [61,62,63,64,65,66,67,68,69,70,71,72,73,74,75]
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        rowManager()
        numberGenerator(bRow, rownumbers: bNumbers)
        numberGenerator(iRow, rownumbers: iNumbers)
        numberGenerator(nRow, rownumbers: nNumbers)
        numberGenerator(gRow, rownumbers: gNumbers)
        numberGenerator(oRow, rownumbers: oNumbers)
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(numberPicker), userInfo: nil, repeats: true)
    }
    
    func numberGenerator(_ row : Array <UIButton>, rownumbers : Array <Int>){
       
        var numbers = rownumbers
        
        for button in row{
            
            let pickedNumber = Int.random(in: 0...numbers.count - 1)
            let number = numbers[pickedNumber]
            numbers.remove(at: pickedNumber)
            
            button.setTitle("\(number)", for: .normal)
        }
    }
    @objc func numberPicker(){
        
        var allNumbers = bNumbers + iNumbers + nNumbers + gNumbers + oNumbers
        
        let pickedNumber = Int.random(in: 0...allNumbers.count - 1)
        let number = allNumbers[pickedNumber]
        allNumbers.remove(at: pickedNumber)
        
        topLabel.text = "\(number)"
    }
    func rowManager() {
        self.bRow = [self.B1Button, self.B2Button, self.B3Button, self.B4Button, self.B5Button]
        self.iRow = [self.I1Button, self.I2Button, self.I3Button, self.I4Button, self.I5Button]
        self.nRow = [self.N1Button, self.N2Button, self.N4Button, self.N5Button]
        self.gRow = [self.G1Button, self.G2Button, self.G3Button, self.G4Button, self.G5Button]
        self.oRow = [self.O1Button, self.O2Button, self.O3Button, self.O4Button, self.O5Button]
    }
    func checkVictory() {
        
    }
}
