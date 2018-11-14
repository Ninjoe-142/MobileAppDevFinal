//
//  BingoCardViewController.swift
//  MobileAppDevFinal
//
//  Created by Joseph DeCrisanti on 10/15/18.
//  Copyright © 2018 Joseph DeCrisanti. All rights reserved.
//

import UIKit
import Foundation

enum  WinConition : String{
    case vertical
    case horizontal
    case diagonal
    case none
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
        checkVictory(sender)
    }
    
    var bColumn = [UIButton]()
    var iColumn = [UIButton]()
    var nColumn = [UIButton]()
    var gColumn = [UIButton]()
    var oColumn = [UIButton]()
    var allColumns = [Array <UIButton>]()
    
    var diagonal1 = [UIButton]()
    var diagonal2 = [UIButton]()
    var allDiagonals = [Array <UIButton>]()
    
    var row1 = [UIButton]()
    var row2 = [UIButton]()
    var row3 = [UIButton]()
    var row4 = [UIButton]()
    var row5 = [UIButton]()
    var allRows = [Array <UIButton>]()
    
    var bNumbers = [1,2,3,4,5,6,7,8,9,10,12,13,14,15]
    var iNumbers = [16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
    var nNumbers = [31,32,33,34,35,36,37,38,39,40,41,42,43,44,45]
    var gNumbers = [46,47,48,49,50,51,52,53,54,55,56,57,58,49,60]
    var oNumbers = [61,62,63,64,65,66,67,68,69,70,71,72,73,74,75]
    var allNumbers = [Int]()
    
    var timer = Timer()
    
    var winNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        
        rowManager()
        numberGenerator(bColumn, columnNumbers: bNumbers)
        numberGenerator(iColumn, columnNumbers: iNumbers)
        numberGenerator(nColumn, columnNumbers: nNumbers)
        numberGenerator(gColumn, columnNumbers: gNumbers)
        numberGenerator(oColumn, columnNumbers: oNumbers)
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(numberPicker), userInfo: nil, repeats: true)
    }
    
    func numberGenerator(_ column : Array <UIButton>, columnNumbers : Array <Int>){
       
        var numbers = columnNumbers
        
        for button in column{
            
            let pickedNumber = Int.random(in: 0...numbers.count - 1)
            let number = numbers[pickedNumber]
            numbers.remove(at: pickedNumber)
            
            button.setTitle("\(number)", for: .normal)
        }
        freeButton.setTitle("free", for: .normal)
    }
    
    @objc func numberPicker(){
        
        if allNumbers.count == 0{
            timer.invalidate()
            navigationItem.hidesBackButton = false
            topLabel.text = "You Lost"
        }
        
        let pickedNumber = Int.random(in: 0...allNumbers.count - 1)
        let number = allNumbers[pickedNumber]
        allNumbers.remove(at: pickedNumber)
        
        topLabel.text = "\(number)"
    }
    
    func rowManager() {
        self.bColumn = [B1Button, B2Button, B3Button, B4Button, B5Button]
        self.iColumn = [I1Button, I2Button, I3Button, I4Button, I5Button]
        self.nColumn = [N1Button, N2Button, N4Button, N5Button, freeButton]
        self.gColumn = [G1Button, G2Button, G3Button, G4Button, G5Button]
        self.oColumn = [O1Button, O2Button, O3Button, O4Button, O5Button]
        
        self.diagonal1 = [B1Button, I2Button, G4Button, O5Button, freeButton]
        self.diagonal2 = [B5Button, I4Button, G2Button, O1Button, freeButton]
        
        self.row1 = [B1Button, I1Button, N1Button, G1Button, O1Button]
        self.row2 = [B2Button, I2Button, N2Button, G2Button, O2Button]
        self.row3 = [B3Button, I3Button, G3Button, O3Button, freeButton]
        self.row4 = [B4Button, I4Button, N4Button, G4Button, O4Button]
        self.row5 = [B5Button, I5Button, N5Button, G5Button, O5Button]
        
        self.allDiagonals = [diagonal1, diagonal2]
        self.allColumns = [bColumn, iColumn, nColumn, gColumn, oColumn]
        self.allRows = [row1, row2, row3, row4, row5]
        
        self.allNumbers = bNumbers + iNumbers + nNumbers + gNumbers + oNumbers
        
        
    }
    
    func checkVictory(_ sender: UIButton) {
        
        let winningArray = findButton(sender)
        
        let winType = checkBingoType(winningArray)
        
        didWin(winType)
    }
    
    func findButton(_ sender : UIButton) -> Array <UIButton> {
        
        for array in allColumns{
            for _ in array{
                if sender.backgroundColor == UIColor.lightGray{
                    if checkForVictory(array) == true{
                        return array
                    }
                }
            }
        }
        
        for array in allDiagonals{
            for _ in array{
                if sender.backgroundColor == UIColor.lightGray{
                    if checkForVictory(array) == true{
                        return array
                    }
                }
            }
        }
        
        for array in allRows{
            for _ in array{
                if sender.backgroundColor == UIColor.lightGray{
                    if checkForVictory(array) == true{
                        return array
                    }
                }
            }
        }
        return []
    }
    
    func checkBingoType(_ array : Array <UIButton>) -> WinConition {
        switch array {
        case bColumn:
            return .vertical
        case iColumn:
            return .vertical
        case nColumn:
            return .vertical
        case gColumn:
            return .vertical
        case oColumn:
            return .vertical
        case diagonal1:
             return .diagonal
        case diagonal2:
            return .diagonal
        case row1:
            return .horizontal
        case row2:
            return .horizontal
        case row3:
            return .horizontal
        case row4:
            return .horizontal
        case row5:
            return .horizontal
        default:
            return .none
        }
    }
    
    func checkForVictory(_ row : Array<UIButton>) -> Bool {
        for buttons in row {
            if buttons.backgroundColor == UIColor.lightGray{
                winNumber += 1
            }
        }
        if winNumber != 5 {
            winNumber = 0
            return false
        }else{
            winNumber = 0
            return true
        }
    }
    
    func didWin(_ type : WinConition) {
        if type != .none{
            timer.invalidate()
            topLabel.text = "You Won \(type.rawValue) bingo"
            navigationItem.hidesBackButton = false
        }
    }
}
