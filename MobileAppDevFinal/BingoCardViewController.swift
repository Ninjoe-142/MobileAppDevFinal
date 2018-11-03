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
    
    var firstDiagonal = [UIButton]()
    var secondDiagonal = [UIButton]()
    
    var bNumbers = [1,2,3,4,5,6,7,8,9,10,12,13,14,15]
    var iNumbers = [16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
    var nNumbers = [31,32,33,34,35,36,37,38,39,40,41,42,43,44,45]
    var gNumbers = [46,47,48,49,50,51,52,53,54,55,56,57,58,49,60]
    var oNumbers = [61,62,63,64,65,66,67,68,69,70,71,72,73,74,75]
    var allNumbers = [Int]()
    
    var timer = Timer()
    
    var horizontalNumber = 0
    var verticalNumber = 0
    var diagonalNumber = 0
    
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
        self.bColumn = [self.B1Button, self.B2Button, self.B3Button, self.B4Button, self.B5Button]
        self.iColumn = [self.I1Button, self.I2Button, self.I3Button, self.I4Button, self.I5Button]
        self.nColumn = [self.N1Button, self.N2Button, self.N4Button, self.N5Button]
        self.gColumn = [self.G1Button, self.G2Button, self.G3Button, self.G4Button, self.G5Button]
        self.oColumn = [self.O1Button, self.O2Button, self.O3Button, self.O4Button, self.O5Button]
        self.allColumns = [bColumn, iColumn, nColumn, gColumn, oColumn]
        self.allNumbers = bNumbers + iNumbers + nNumbers + gNumbers + oNumbers
        
        self.firstDiagonal = [self.B1Button, self.I2Button, self.G4Button, self.O5Button]
        self.secondDiagonal = [self.B5Button, self.I4Button, self.G2Button, self.O1Button]
    }
    
    func checkVictory(_ sender: UIButton) {
        
        let buttonrow = findButton(sender, allColumn: allColumns)
        
        winTypes(buttonrow)
        print("after the whole func \(verticalNumber) from \(sender.titleLabel?.text ?? "error")")
        
        if horizontalNumber == 5{
            didWin(.horizontal)
        }
        if diagonalNumber == 5{
            didWin(.diagonal)
        }
        if verticalNumber == 5{
            didWin(.vertical)
        }
    }
    
    func findButton(_ sender : UIButton, allColumn : Array <Array <UIButton>>) -> Array <UIButton> {
        for array in allColumn{
            for _ in array{
                if sender.backgroundColor == UIColor.lightGray{
                    return array
                }
            }
        }
        return []
    }
    
    func winTypes(_ row : Array<UIButton>){
        for buttons in row {
            if buttons.backgroundColor == UIColor.lightGray{
                verticalNumber += 1
            }
        }
        if verticalNumber != 5 {
            verticalNumber = 0
        }
    }
    
    func didWin(_ type : WinConition) {
        timer.invalidate()
        topLabel.text = "You Won?\(type.rawValue) bingo"
         navigationItem.hidesBackButton = false
    }
}
